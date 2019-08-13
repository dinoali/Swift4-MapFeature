//
//  DetailViewController.swift
//  MonitTest
//
//  Created by Dino Ali on 12/08/19.
//  Copyright © 2019 Dino Ali. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var nameCompanyLabel: UILabel!
    @IBOutlet weak var catchLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    @IBOutlet weak var mapButton: UIButton!
    
    var reciveListName: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapButton.addTarget(self, action: #selector(handleViewMap(_:)), for: .touchUpInside)
        
        self.nameLabel.text = reciveListName?.name
        self.usernameLabel.text = reciveListName?.username
        self.emailLabel.text = reciveListName?.email
        self.phoneLabel.text = reciveListName?.phone
        self.websiteLabel.text = reciveListName?.website
        
        self.streetLabel.text = reciveListName?.address?.street
        self.suiteLabel.text = reciveListName?.address?.suite
        self.cityLabel.text = reciveListName?.address?.city
        self.zipcodeLabel.text = reciveListName?.address?.zipcode
        
        self.nameCompanyLabel.text = reciveListName?.company?.name
        self.catchLabel.text = reciveListName?.company?.catchPhrase
        self.bsLabel.text = reciveListName?.company?.bs

    }
    
    @objc func handleViewMap(_ sender: UIButton) {
        let _lattitide = Double("\(reciveListName?.address?.geo?.lat ?? "")") ?? 0.0
        let _longitude = Double("\(reciveListName?.address?.geo?.lng ?? "")") ?? 0.0
        self.openMapForPlace(_lattitide, _longitude, reciveListName?.address?.city ?? "")
    }
    
    func openMapForPlace(_ lat: Double, _ long: Double, _ placeName: String) {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        
        print(lat, long)
        
        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: options)
    }
}
    

