//
//  ViewController.swift
//  MonitTest
//
//  Created by Dino Ali on 11/08/19.
//  Copyright © 2019 Dino Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var tblList : UITableView!
    let data: [String] = ["kirit", "kevin", "hitesh"]
    
    
    
//    lazy var users: [UserModel] = [
//        UserModel(nama: "Azmi", hobi: hobiAzmi),
//        UserModel(nama: "Rudi", hobi: hobiRudi),
//        UserModel(nama: "Sudin", hobi: hobiSudin)
//    ]
//
//    var hobiAzmi = [
//        Hobi(nama: "Bola"),
//        Hobi(nama: "Voli"),
//        Hobi(nama: "Basket")
//    ]
//
//    var hobiRudi = [
//        Hobi(nama: "Bola"),
//        Hobi(nama: "nonton"),
//        Hobi(nama: "joging")
//    ]
//
//    var hobiSudin = [
//        Hobi(nama: "game"),
//        Hobi(nama: "gym"),
//        Hobi(nama: "salon")
//    ]
//
    
    lazy var dataSiswa: [Sekolah] = [
        Sekolah(nama: "SMA 1 Solok", kelas: nil, alamat: "Solok"),
        Sekolah(nama: "MAN 1 Batusangkar", kelas: nil, alamat: "Batusangkar"),
        Sekolah(nama: "SMK Muhammadiyah", kelas: nil, alamat: "Cilandak")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.delegate = self
        tblList.dataSource = self
        tblList.rowHeight = UITableView.automaticDimension
        
        for i in dataSiswa {
            print("Sekolah: \(i.nama)\nAlamat: \(i.alamat)")
        }
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellData") as! UserTableViewCell
        cell.nameLabel.text = "Azmi"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
