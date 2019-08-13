//
//  ViewController.swift
//  MonitTest
//
//  Created by Dino Ali on 11/08/19.
//  Copyright © 2019 Dino Ali. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class ViewController: UIViewController {
    @IBOutlet var tblList: UITableView!
    
    var listName: [UserModel]?
    var listAddress: [UserAddress]?
    var listComp: [UserCompany]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        setupData()
    }
    
    func setupComponent() {
        tblList.rowHeight = UITableView.automaticDimension
        tblList.estimatedRowHeight = 50
    }
    
    func setupData() {
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            switch response.result {
            case .success(let value):
                let data = JSON(value)
                if let item = data.array {
                    self.listName = item.map { UserModel(json: JSON($0.object)) }
                }
                self.tblList.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! UserTableViewCell
        cell.users = listName?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = mainStoryboard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController {
            vc.reciveListName = listName?[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
