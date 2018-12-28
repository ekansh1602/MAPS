//
//  ViewController.swift
//  MAPS
//
//  Created by Ekansh Anand Srivastava on 11/12/18.
//  Copyright © 2018 Avi Srivastava. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude : CLLocationDegrees =  27.173891
        let longitude : CLLocationDegrees = 78.042068
        let latideltazoom : CLLocationDegrees = 0.05
        let longideltazoom : CLLocationDegrees = 0.05
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latideltazoom, longitudeDelta: longideltazoom)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        let annotations = MKPointAnnotation()
        annotations.title = "Taj Mahal"
        annotations.subtitle = "Must Visit"
        annotations.coordinate = location
        mapview.addAnnotation(annotations)
        
        mapview.setRegion(region, animated: true)
        
        let longpressgesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longress(gesturerecongnizer:)))
        longpressgesture.minimumPressDuration = 2
        mapview.addGestureRecognizer(longpressgesture)
        
    }
    
    @objc func longress(gesturerecongnizer: UIGestureRecognizer){
        let touchpoint = gesturerecongnizer.location(in: self.mapview)
        let coordinate = mapview.convert(touchpoint, toCoordinateFrom: self.mapview)
        let annotation = MKPointAnnotation()
        annotation.title = "New Place"
        annotation.subtitle = "Must visit also"
        annotation.coordinate = coordinate
    }
    

    @IBOutlet weak var mapview: MKMapView!
    
}


