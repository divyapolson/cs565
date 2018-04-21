/*
 * Copyright 2016 Google Inc. All rights reserved.
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import UIKit
import GoogleMaps
import GooglePlaces
import UserNotifications

class MapViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    //var likelyPlaces: [GMSPlace] = []
    
    var likelyPlaces: [String] = []
    
    // The currently selected place.
    //var selectedPlace: GMSPlace?
    
    var selectedPlace: String = ""
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: 40.1092, longitude: -88.2272)
    
    // Update the map once the user has made their selection.
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        // Clear the map.
        mapView.clear()
        
        // Add a marker to the map.
        /*
        if selectedPlace != nil {
            let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
            marker.title = selectedPlace?.name
            marker.snippet = selectedPlace?.formattedAddress
            marker.map = mapView
        }
        */
        listLikelyPlaces()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let content = UNMutableNotificationContent()
        content.title = "Long time no see!"
        content.body = "You haven't check in at GO for a while! We all missed you :)"
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timeidentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
        
        // Initialize the location manager.
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
        
        // Create a map.
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        self.mapView.delegate = self
        
        do {
            // Set the map style by passing the URL of the local file. Make sure style.json is present in your project
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                print("Unable to find style.json")
            }
        } catch {
            print("The style definition could not be loaded: \(error)")
        }
        
        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        mapView.isHidden = true
        
        listLikelyPlaces()
        
        //add markers
  
        for space in spaces {
            let space_marker = GMSMarker()
            space_marker.position = CLLocationCoordinate2D(latitude: space.lat, longitude: space.long)
            space_marker.title = space.name
            space_marker.snippet = "\(space.emojis)\n\(space.desc)"
            space_marker.icon = GMSMarker.markerImage(with: UIColor(red:0.20, green:0.68, blue:0.75, alpha:1.0))
            space_marker.map = mapView
        }
        
        var myLocation: CLLocation!
        myLocation = locationManager.location
        
        var closestLocation:CLLocation?
        var smallestDistance: CLLocationDistance?
        print("You are currently at \(String(describing: myLocation))")
        
        var placeName:String = ""
        var nearbyPlaces = [String]()
        var nearbyPlaces0 = [String]()
        var nearbyLocation:CLLocation?
        var nearbyLocations = [CLLocation?]()
        
        var placearray : [placesAndDistances] = []
        
        //find closest location and nearby locations
        for space in spaces {
            let distance = myLocation.distance(from: CLLocation(latitude: space.lat, longitude: space.long))
            if smallestDistance == nil || distance < smallestDistance! {
                closestLocation = CLLocation(latitude: space.lat, longitude: space.long)
                smallestDistance = distance
                spaceName = space.name
            }
            if distance < 600.00 {
                placeName = space.name
                nearbyLocation = CLLocation(latitude: space.lat, longitude: space.long)
                nearbyPlaces.append(placeName)
                let temp = placesAndDistances()
                temp.name = placeName
                temp.distance = distance
                placearray.append(temp)
                nearbyLocations.append(nearbyLocation)
                print("READ THIS = \(distance) + \(placeName)")
            }
        }
        placearray.sort(by:{$0.distance < $1.distance})
        for i in placearray {
            nearbyPlaces0.append(i.name)
        }
        print("You are closest to \(String(describing: spaceName)) at \(String(describing: closestLocation))")
        print("You are also close to: \(nearbyPlaces)")
        print("these are the coordinates: \(nearbyLocations)")
        
        globalLocations = nearbyLocations
        globalPlaces = nearbyPlaces0
        print("===========\(globalPlaces)")
        
    }
    
    // Populate the array with the list of likely places.
    func listLikelyPlaces() {
        // Clean up from previous sessions.
        likelyPlaces.removeAll()
        
        placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
            if let error = error {
                // TODO: Handle the error.
                print("Current Place error: \(error.localizedDescription)")
                return
            }

            self.likelyPlaces.removeAll()
            
            for nearbyLocation in globalPlaces {
                let place = nearbyLocation
                self.likelyPlaces.append(place)
            }
            
            print("========\(self.likelyPlaces)")
 
        })
    }
    
    // Prepare the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSelect" {
            if let nextViewController = segue.destination as? PlacesViewController {
                nextViewController.likelyPlaces = likelyPlaces
            }
        }
    }
}

// Delegates to handle events for the location manager.
extension MapViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
        listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}

extension MapViewController: GMSMapViewDelegate {
    internal func mapView(_ mapView: GMSMapView, didTapInfoWindowOfMarker marker: GMSMarker) -> Bool {
        selectedPlace = marker.title!
        globalSelectedPlaces = selectedPlace
        performSegue(withIdentifier: "todetail", sender: self)
        return true
    }
}

