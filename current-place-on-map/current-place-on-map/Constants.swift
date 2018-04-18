//
//  Constants.swift
//  current-place-on-map
//
//  Created by Divya Polson on 4/14/18.
//  Copyright © 2018 William French. All rights reserved.
//

import Foundation
import CoreLocation

//global variable for closest location
var spaceName:String = ""

var globalLocations = [CLLocation?]()

var globalPlaces = [String]()

var globalSelectedPlaces:String = ""

var globalUsername:String = ""

struct Space {
    let name: String
    let lat: CLLocationDegrees
    let long: CLLocationDegrees
    let desc: String
}

var spaces = [
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
    Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "description"),
    Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "description"),
]

var dict: [String:Space] = [
    "Spurlock Museum":Space(name: "Spurlock Museum", lat: 40.107842, long: -88.220805, desc: "cool description"),
    "Champaign Public Library":Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "description"),
    "Krannert Center for the Performing Arts":Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "more"),
    "Krannert Art Museum":Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "description"),
    "Hessel Park":Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "description"),
    "Florida and Lincoln Playing Field":Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "description"),
    "University of Illinois Arboretum":Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "description"),
    "Japan House":Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "description"),
    "Stanley Illini Grove":Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "description"),
    "Dorner Drive Playing Fields":Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "description"),"University of Illinois Observatory":Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "description"),"UI Ice Arena":Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "description"),"Washington Park":Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "description"),"Scott Park":Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "description"),"Main Quad":Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "description"),"South Quad":Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "description"),"Bardeen Quadrangle":Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "description"),"Activities and Recreation Center":Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "description"),"Stadium Terrace Playing Field":Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "description"),"Campus Recreation Center East":Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "description"),"Carle Park":Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "description"),"Blair Park":Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "description"),"Crystal Lake Park":Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "description"),"Douglass Park":Space(name: "Douglass Park", lat: 40.124355, long: -88.230366, desc: "description"),"Urbana Free Library":Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "description"),"Main Library":Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "description"),"Funk Agricultural, Consumer, and Environmental Sciences Library":Space(name: "Funk Agricultural, Consumer, and Environmental Sciences Library", lat: 40.102836, long: -88.225100, desc: "description"),"Orpheum Children's Science Museum":Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "description"),"Undergraduate Library":Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "description"),"Champaign-Urbana Community Fab Lab":Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "description"),"McCollum Park":Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "description"),"Leal Park":Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "description"),"King Park":Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "description"),"University of Illinois Round Barns":Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "description"),"Meadowbrook Park":Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "description")]

class placesAndDistances {
    var name = String()
    var distance = Double()
}

