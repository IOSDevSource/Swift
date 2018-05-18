//
//  NormalMapViewController.swift
//  DemoGoogleMaps
//
//  Created by iexm01 on 18/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class NormalMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    //MARK: - Variable Declaration
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var zoomLevel: Float = 15.0
    var camera = GMSCameraPosition()
    var  marker = GMSMarker()
    var realaddress = ""
    var lat: Double = 11.010744
    var lon: Double = 76.958440
    @IBOutlet var mapViewDemo: GMSMapView!
    @IBOutlet var containerMapView: UIView!
    var curlat = Double()
    var curlong = Double()

    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        googleMapSetup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func googleMapSetup() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: zoomLevel)
        mapViewDemo = GMSMapView.map(withFrame: self.mapViewDemo.bounds, camera: camera)
        mapViewDemo.isMyLocationEnabled = true
        mapViewDemo.delegate = self
        containerMapView.addSubview(mapViewDemo)
        containerMapView = mapViewDemo
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = "Current Location"
        marker.icon = GMSMarker.markerImage(with: UIColor.init(red: 11.0/255.0, green: 45.0/255.0, blue: 113.0/255.0, alpha: 1))
        marker.map = mapViewDemo
        marker.isDraggable = true
        let strAddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print("address == \(strAddress)")
    }    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        curlat = location.coordinate.latitude
        curlong = location.coordinate.longitude
        camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        self.mapViewDemo.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
    }

    @IBAction func back_action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
