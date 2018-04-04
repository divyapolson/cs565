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

class MapViewController: UIViewController {

  var locationManager = CLLocationManager()
  var currentLocation: CLLocation?
  var mapView: GMSMapView!
  var placesClient: GMSPlacesClient!
  var zoomLevel: Float = 15.0

  // An array to hold the list of likely places.
  var likelyPlaces: [GMSPlace] = []

  // The currently selected place.
  var selectedPlace: GMSPlace?

  // A default location to use when location permission is not granted.
  let defaultLocation = CLLocation(latitude: 40.1092, longitude: -88.2272)

  // Update the map once the user has made their selection.
  @IBAction func unwindToMain(segue: UIStoryboardSegue) {
    // Clear the map.
    mapView.clear()

    // Add a marker to the map.
    if selectedPlace != nil {
      let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
      marker.title = selectedPlace?.name
      marker.snippet = selectedPlace?.formattedAddress
      marker.map = mapView
    }

    listLikelyPlaces()
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()

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

    // Add the map to the view, hide it until we've got a location update.
    view.addSubview(mapView)
    mapView.isHidden = true

    listLikelyPlaces()
    
    //added
    
    struct Space {
        let name: String
        let lat: CLLocationDegrees
        let long: CLLocationDegrees
        let desc: String
    }

    let spaces = [
        Space(name: "Spurlock Museum", lat: 40.107842, long: -88.220805, desc: "cool description"),
        Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "description"),
        Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "more"),
        Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "description"),
        Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "description"),
        Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "description"),
        Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "description"),
        Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "description"),
        Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "description"),
        Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "description"),
        Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "description"),
        Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "description"),
        Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "description"),
        Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "description"),
        Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "description"),
        Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "description"),
        Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "description"),
        Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "description"),
        Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "description"),
        Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "description"),
        Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "description"),
        Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "description"),
        Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "description"),
        Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "description"),
        Space(name: "Douglass Park", lat: 40.124355, long: -88.230366, desc: "description"),
        Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "description"),
        Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "description"),
        Space(name: "Funk Agricultural, Consumer, and Environmental Sciences Library", lat: 40.102836, long: -88.225100, desc: "description"),
        Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "description"),
        Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "description"),
        Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "description"),
        Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "description"),
        Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "description"),
        Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "description"),
        Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "description"),
        Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "description"),
    ]
    
    for space in spaces {
        let space_marker = GMSMarker()
        space_marker.position = CLLocationCoordinate2D(latitude: space.lat, longitude: space.long)
        space_marker.title = space.name
        space_marker.snippet = space.desc
        space_marker.map = mapView
    }
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

      // Get likely places and add to the list.
      if let likelihoodList = placeLikelihoods {
        for likelihood in likelihoodList.likelihoods {
          let place = likelihood.place
          self.likelyPlaces.append(place)
        }
      }
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
