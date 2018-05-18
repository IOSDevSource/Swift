//
//  MovableAnnViewController.swift
//  DemoGoogleMaps
//
//  Created by iexm01 on 18/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MovableAnnViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var containerMapView2: UIView!
    @IBOutlet var mapViewDemo2: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 15.0
    var camera = GMSCameraPosition()
    var  marker = GMSMarker()
    var realaddress = ""
    var lat: Double = 11.010744
    var lon: Double = 76.958440

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: zoomLevel)
        mapViewDemo2 = GMSMapView.map(withFrame: self.mapViewDemo2.bounds, camera: camera)
        mapViewDemo2.isMyLocationEnabled = true
        mapViewDemo2.delegate = self
        containerMapView2.addSubview(mapViewDemo2)
        containerMapView2 = mapViewDemo2
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = "Current Location"
        marker.icon = GMSMarker.markerImage(with: UIColor.init(red: 11.0/255.0, green: 45.0/255.0, blue: 113.0/255.0, alpha: 1))
        marker.map = mapViewDemo2
        marker.isDraggable = true
        let strAddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print("address == \(strAddress)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back_draggableAnn_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("marker dragged to location: \(marker.position.latitude),\(marker.position.longitude)")
        let realaddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print("address == \(realaddress)")
        lat = marker.position.latitude
        lon = marker.position.longitude
    }

}
