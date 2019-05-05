//
//  MapViewController.swift
//  Day1
//
//  Created by Aritro Paul on 05/05/19.
//  Copyright © 2019 Aritropaul. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    let names = ["Razor", "Hi-Tech", "Xiaomi", "Razor 2"]
    let models = ["SCT0093","SCT0056","SCT0068","SCT0095"]
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var scootyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        scootyCollectionView.showsHorizontalScrollIndicator = false
        scootyCollectionView.delegate = self
        scootyCollectionView.dataSource = self
        
        mapView.animate(to: GMSCameraPosition.camera(withLatitude: 12.9610484, longitude: 77.5981277, zoom: 14.0))
        
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                print("❌ Unable to find style.json")
            }
        } catch {
            print("❌ One or more of the map styles failed to load. \(error)")
        }
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 12.9610484, longitude: 77.5981277)
        marker.icon = UIImage(named: "Icon")
        marker.map = mapView
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 12.959643, longitude: 77.600016)
        marker2.icon = UIImage(named: "marker2")
        marker2.map = mapView
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 12.961253, longitude: 77.599394)
        marker3.icon = UIImage(named: "marker3")
        marker3.map = mapView
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 12.959394, longitude: 77.598086)
        marker4.icon = UIImage(named: "marker3")
        marker4.map = mapView
        // Do any additional setup after loading the view.
    }
    
}

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scell", for: indexPath) as! SelectedCollectionViewCell
            cell.backView.makeCard()
            cell.modelName.text = models[indexPath.item]
            cell.ScootyName.text = names[indexPath.item]
            cell.backView.layer.cornerRadius = 24
            cell.takeButton.layer.cornerRadius = cell.takeButton.frame.height/2
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScootyCollectionViewCell
            cell.backView.makeCard()
            cell.modelName.text = models[indexPath.item]
            cell.ScootyName.text = names[indexPath.item]
            cell.backView.layer.cornerRadius = 24
            cell.DistanceButton.layer.cornerRadius = cell.DistanceButton.frame.height/2
            return cell
        }
    }
    
    
}

extension MapViewController: GMSMapViewDelegate {
    
}

extension UIView{
    func makeCard(){
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor.black.cgColor
    }
}
