//
//  MultipleAnnViewController.swift
//  DemoGoogleMaps
//
//  Created by iexm01 on 18/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MultipleAnnViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var containerMapView1: UIView!
    @IBOutlet var mapViewDemo1: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 7.0
    var camera = GMSCameraPosition()
    var  marker = GMSMarker()
    var realaddress = ""
    var lat: Double = 11.010744
    var lon: Double = 76.958440
    var curlat = Double()
    var curlong = Double()
    
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
        mapViewDemo1 = GMSMapView.map(withFrame: self.mapViewDemo1.bounds, camera: camera)
        mapViewDemo1.isMyLocationEnabled = true
        mapViewDemo1.delegate = self
        containerMapView1.addSubview(mapViewDemo1)
        containerMapView1 = mapViewDemo1
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 9.9252, longitude: 78.1198)
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 10.5846, longitude: 77.2514)
        marker.title = "Current Location"
        marker.icon = GMSMarker.markerImage(with: UIColor.init(red: 11.0/255.0, green: 45.0/255.0, blue: 113.0/255.0, alpha: 1))
        marker.map = mapViewDemo1
        marker1.map = mapViewDemo1
        marker2.map = mapViewDemo1
        marker.isDraggable = true
        let strAddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print("address == \(strAddress)")

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back_multipleAnnotation_action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
