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
    let emojis: String
}

var spaces = [
    Space(name: "Spurlock Museum", lat: 40.107842, long: -88.220805, desc: "Ethnographic museum featuring cultural and historical artifacts, celebrating diversity of cultures through time and across the globe.", emojis: "🏛📚🙂"),
    Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "Educational and performing arts complex for the University of Illinois.", emojis: "🎭🎻🙂"),
    Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "description", emojis: "🎨📚🙂"),
    Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "description", emojis: "🏯🌸🙂"),
    Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "The University's historic observatory, open frequently for public viewing sessions and open houses.", emojis: "🏛📚🙂"),
    Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "description", emojis: "⛸🏒🙂"),
    Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Douglass Park", lat: 40.124355, long: -88.230366, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Funk Agricultural, Consumer, and Environmental Sciences Library", lat: 40.102836, long: -88.225100, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "description", emojis: "🔬📚🙂"),
    Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "description", emojis: "🏞📚🙂"),
    Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "description", emojis: "🏛📚🙂"),
    Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "description", emojis: "🏞📚🙂"),
]

var dict: [String:Space] = [
    "Spurlock Museum":Space(name: "Spurlock Museum", lat: 40.107842, long: -88.220805, desc: "Ethnographic museum featuring over 51,000 cultural and historical artifacts, celebrating diversity of cultures through time and across the globe.", emojis: "🏛📚🙂"),
    "Champaign Public Library":Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "description", emojis: "🏛📚🙂"),
    "Krannert Center for the Performing Arts":Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "Educational and performing arts complex for the University of Illinois. Catch a classical concert or theatrical performance in one of their five theaters!", emojis: "🎭🎻🙂"),
    "Krannert Art Museum":Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "description", emojis: "🎨📚🙂"),
    "Hessel Park":Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "description", emojis: "🏞📚🙂"),
    "Florida and Lincoln Playing Field":Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "description", emojis: "🏛📚🙂"),
    "University of Illinois Arboretum":Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "description", emojis: "🏛📚🙂"),
    "Japan House":Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "description", emojis: "🏯🌸🙂"),
    "Stanley Illini Grove":Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "description", emojis: "🏛📚🙂"),
    "Dorner Drive Playing Fields":Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "description", emojis: "🏛📚🙂"),
    "University of Illinois Observatory":Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "The University's historic observatory, open frequently for public viewing sessions and open houses.", emojis: "🏛📚🙂"),
    "UI Ice Arena":Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "description", emojis: "⛸🏒🙂"),
    "Washington Park":Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "description", emojis: "🏛📚🙂"),
    "Scott Park":Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "description", emojis: "🏞📚🙂"),
    "Main Quad":Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "description", emojis: "🏛📚🙂"),
    "South Quad":Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "description", emojis: "🏛📚🙂"),
    "Bardeen Quadrangle":Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "description", emojis: "🏛📚🙂"),
    "Activities and Recreation Center":Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "description", emojis: "🏛📚🙂"),
    "Stadium Terrace Playing Field":Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "description", emojis: "🏛📚🙂"),
    "Campus Recreation Center East":Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "description", emojis: "🏛📚🙂"),
    "Carle Park":Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "description", emojis: "🏛📚🙂"),
    "Blair Park":Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "description", emojis: "🏛📚🙂"),
    "Crystal Lake Park":Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "description", emojis: "🏛📚🙂"),
    "Douglass Park":Space(name: "Douglass Park", lat: 40.124355, long: -88.230366, desc: "description", emojis: "🏛📚🙂"),
    "Urbana Free Library":Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "description", emojis: "🏛📚🙂"),
    "Main Library":Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "description", emojis: "🏛📚🙂"),
    "Funk Agricultural, Consumer, and Environmental Sciences Library":Space(name: "Funk Agricultural, Consumer, and Environmental Sciences Library", lat: 40.102836, long: -88.225100, desc: "description", emojis: "🏛📚🙂"),
    "Orpheum Children's Science Museum":Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "description", emojis: "🔬📚🙂"),
    "Undergraduate Library":Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "description", emojis: "🏛📚🙂"),
    "Champaign-Urbana Community Fab Lab":Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "description", emojis: "🏛📚🙂"),
    "McCollum Park":Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "description", emojis: "🏛📚🙂"),
    "Leal Park":Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "description", emojis: "🏛📚🙂"),
    "King Park":Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "description", emojis: "🏛📚🙂"),
    "University of Illinois Round Barns":Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "description", emojis: "🏛📚🙂"),
    "Meadowbrook Park":Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "description", emojis: "🏛📚🙂")]

class placesAndDistances {
    var name = String()
    var distance = Double()
}


