//
//  ViewController.swift
//  Maps Direction
//
//  Created by Ethan Herrera on 1/9/23.
//  Copyright © 2023 ETHANCODEY. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire

class ViewController: UIViewController , GMSMapViewDelegate {
    
    //UI Elements DO NOT TOUCH! You will break the app lmao...
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var destinationLocation: UITextField!
    @IBOutlet weak var startLocation: UITextField!
    
    //initialize state variables to keep track of markers and polylines on your map
    
    
    // Coordinates for drawing path
    var startCoordinate = CLLocationCoordinate2D()
    var endCoordinate = CLLocationCoordinate2D()
    
    func createMarker(titleMarker: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees, icon: UIImage, snippet: String = "") -> GMSMarker {
        
        // Create a marker, attach it to the map view, return the marker
        
        // delete this statement
        return GMSMarker()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Your map initiation code
        
        //Create your permanent markers here
        
    }
    
    @IBAction func openStartLocation(_ sender: UIButton) {
        
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        //optional logic to update selected location etc...
        
        self.present(autoCompleteController, animated: true, completion: nil)
    }
    
    
    @IBAction func openDestinationLocation(_ sender: UIButton) {
        
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        //optional logic to update selected location etc...
        
        UISearchBar.appearance().setTextColor(color: UIColor.black)
        
        self.present(autoCompleteController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func showDirection(_ sender: UIButton) {
        self.drawPath(startLocation: startCoordinate, endLocation: endCoordinate)
    }

    
    func drawPath(startLocation: CLLocationCoordinate2D, endLocation: CLLocationCoordinate2D)
    {
        //draw the path on the map using polyline
    }
    
    //do not delete
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        googleMaps.isMyLocationEnabled = true
    }
    
    //do not delete
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        googleMaps.isMyLocationEnabled = true
        
        if (gesture) {
            mapView.selectedMarker = nil
        }
    }
    
    //do not delete
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        googleMaps.isMyLocationEnabled = true
        return false
    }
    
    //do not delete
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("COORDINATE \(coordinate)")
    }
    
    //do not delete
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        googleMaps.isMyLocationEnabled = true
        googleMaps.selectedMarker = nil
        return false
    }
}


extension ViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error \(error)")
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        //change map location to selected location
        
        //set respective text field to selected location
        
        //create markers for starting and ending points conditionally
        
        // do not delete this
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //do not delete
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //do not delete
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    //do not delete
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}


//utility
public extension UISearchBar {
    
    public func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    
}
