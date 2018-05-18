//
//  RouteMapViewController.swift
//  DemoGoogleMaps
//
//  Created by iexm01 on 18/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces

class RouteMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var containerMapView3: UIView!
    @IBOutlet var mapViewDemo3: GMSMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    var camera = GMSCameraPosition()
    var  marker = GMSMarker()
    let polyline = GMSPolyline()
    var realaddress = ""
    var lat: Double = 11.010744
    var lon: Double = 76.958440
    var curlat: Double = 10.5846
    var curlong: Double = 77.2514

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        self.locationManager.startUpdatingLocation()
        
        camera = GMSCameraPosition.camera(withLatitude: lat, longitude:lon, zoom: zoomLevel)
        mapViewDemo3 = GMSMapView.map(withFrame: self.mapViewDemo3.bounds, camera: camera)
        mapViewDemo3.isMyLocationEnabled = true
        mapViewDemo3.delegate = self
        containerMapView3.addSubview(mapViewDemo3)
        containerMapView3 = mapViewDemo3
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: curlat, longitude: curlong)
        marker.title = "Current Location"
        marker.icon = GMSMarker.markerImage(with: UIColor.init(red: 11.0/255.0, green: 45.0/255.0, blue: 113.0/255.0, alpha: 1))
        marker.map = mapViewDemo3
        marker1.map = mapViewDemo3
        marker1.isDraggable = true
        let strAddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print("address == \(strAddress)")
        drawRouteMap()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Google Maps Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        curlat = location.coordinate.latitude
        curlong = location.coordinate.longitude
        camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        self.mapViewDemo3.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
        drawRouteMap()
    }

    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("marker dragged to location: \(marker.position.latitude),\(marker.position.longitude)")
        let realaddress = Common.getAddressFromLatLon(pdblLatitude: "\(marker.position.latitude)", withLongitude: "\(marker.position.longitude)")
        print(realaddress)
        curlat = marker.position.latitude
        curlong = marker.position.longitude
        drawRouteMap()
    }

    func drawRouteMap() {
        let a_coordinate_string = "\(lat),\(lon)"
        let b_coordinate_string = "\(curlat),\(curlong)"
        print(a_coordinate_string)
        print(b_coordinate_string)
        
//        let APIKey = "AIzaSyBEib1TBMsX_OjYjah_bJ9kuyT0lxqkgBk"
        let APIKey = "AIzaSyB5HG_68kSulno6yRinDllSpA9piQB4iG0"
        
        //        let urlString = "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=\(a_coordinate_string)&destinations=\(b_coordinate_string)&key=\(APIKey)"
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(a_coordinate_string)&destination=\(b_coordinate_string)&key=\(APIKey)"
        
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else { return }
            do {
                let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
                print(str)
                let dict = str as! NSDictionary
                
                if let array = dict["routes"] as? NSArray {
                    if array.count == 0 {
                        print("REQUEST_DENIED")
                        return
                    }
                    if let routes = array[0] as? NSDictionary{
                        if let overview_polyline = routes["overview_polyline"] as? NSDictionary{
                            if let points = overview_polyline["points"] as? String{
                                print(points)
                                // Use DispatchQueue.main for main thread for handling UI
                                DispatchQueue.main.async {
                                    // show polyline
                                    let path = GMSPath(fromEncodedPath:points)
                                    self.polyline.path = path
                                    self.polyline.strokeWidth = 5
                                    self.polyline.strokeColor = UIColor.init(red: 11.0/255.0, green: 45.0/255.0, blue: 113.0/255.0, alpha: 1)
                                    self.polyline.map = self.mapViewDemo3
                                }
                            }
                        }
                    }
                }
            } catch {
                print("json error: \(error)")
            }
        }
        task.resume()
    }
    @IBAction func back_routeMap_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
