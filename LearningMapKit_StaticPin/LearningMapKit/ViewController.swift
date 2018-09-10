//
//  ViewController.swift
//  LearningMapKit
//
//  Created by Fabiola Hernández on 9/3/18.
//  Copyright © 2018 Fabiola Hernández. All rights reserved.
//

import UIKit
import MapKit

final class ClassAnotations : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var stitle: String?
    
    init(coordinate:CLLocationCoordinate2D, title:String?, stitle:String?){
        self.coordinate = coordinate;
        self.title = title;
        self.stitle = stitle;
        
        super.init();
    }
    
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05);
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier);
        
        // static coordinates
        //let location = CLLocationCoordinate2D(latitude: 20.659698, longitude: -103.349609)
        //let anotation = ClassAnotations(coordinate: location, title: "Agua Azul Park", stitle: "This is the place (:");
        
        let location2 = CLLocationCoordinate2D(latitude: -33.470756, longitude: -70.656015)
        let anotation2 = ClassAnotations(coordinate: location2, title: "CARBI", stitle: "Aquì vive el amor de Juan")
        //mapView.addAnnotation(anotation);
        mapView.addAnnotation(anotation2)
        mapView.setRegion(anotation2.region, animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : MKMapViewDelegate{
    // returns MKAnotationView
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let pin = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView{
            
            pin.animatesWhenAdded   = true;
            pin.titleVisibility     = .adaptive;
            pin.subtitleVisibility  = .adaptive;
            
            return pin;
        }
        return nil;
    }
    
}
