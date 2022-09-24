//
//  SiparisVC.swift
//  Food
//
//  Created by melek türüdi on 24.09.2022.
//

import UIKit
import MapKit
import CoreLocation

class TakipVC: UIViewController {

     var lm = CLLocationManager()
    
    
    @IBOutlet weak var viewLoad: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        lm.delegate = self
        lm.startUpdatingLocation()
        
        
    }
}
extension TakipVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonkonum = locations[locations.count-1]
        
        let enlem = sonkonum.coordinate.latitude
        let boylam = sonkonum.coordinate.longitude
        let hiz = sonkonum.speed
        
        
        let konum = CLLocationCoordinate2D(latitude: enlem , longitude: boylam)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        viewLoad.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "\(enlem) - \(boylam)"
        pin.subtitle = "Sipariş Durum"
        viewLoad.addAnnotation(pin)
        viewLoad.showsUserLocation = true
    }

}
