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
    Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "Champaign Public Library offers books, DVDs, CDs, ebooks, streaming music & movies, family events, a bookstore, cafe, and more.", emojis: "📕📚😌"),
    Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "Educational and performing arts complex for the University of Illinois.", emojis: "🎭🎻🙂"),
    Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "Vibrant exchange of ideas in the visual arts, with a permanent collection that contains more than 10,000 works of art.", emojis: "🎨🖌😊"),
    Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "Public park with 25 different tree varieties, playground, and splash pad.", emojis: "🏞💦😌"),
    Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "Open playing fields perfect for engaging in team sports or other large group activities.", emojis: "🌱🏑😜"),
    Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "University's 57-acre arboretum houses multiple gardens that facilitate teaching, research, and public service programs.", emojis: "🌲🌻😌"),
    Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "Celebrates the study of Japanese aesthetics and traditional arts, and offers a place of tranquility and cultural understanding.", emojis: "🏯🌸🙂"),
    Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "Illini Grove houses facilities that encourage outdoor activities and get-togethers, such as basketball/tennis/volleyball courts and picnic sites.", emojis: "🌳🎾😛"),
    Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "Open playing fields and tennis courts perfect for team sports and other large group activities.", emojis: "🏓🍃😀"),
    Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "The University's historic observatory, open frequently for public viewing sessions and open houses.", emojis: "🌑🔭🙂"),
    Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "Instructional ice skating programs, public skating sessions, intramural sports leagues, club activities, and more!", emojis: "⛸🏒😃"),
    Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "This park is home to a basketball court, two volleyball courts, a picnic area, outdoor grills, and an outdoor water fountain.", emojis: "🏞🏐😊"),
    Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "This park features a playground, basketball court, walking path, and a covered picnic area with outdoor grills and drinking fountains.", emojis: "🏀👣😜"),
    Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "The heart of campus, the Main Quad is an open space to relax, play games, and socialize.", emojis: "🍃🐿☺️"),
    Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "Open area between Mumford Hall and David Kinley Hall that is home to the iconic South Quad Bell Tower.", emojis: "🔔🐿🙂"),
    Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "The engineering quadrangle, stretching from Engineering Hall to the Grainger Engineering Library, dedicated in honor of John Bardeen.", emojis: "🍃🐿☺️"),
    Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "One of the country's largest campus recreation centers, with amenities such as a climbing wall, swimming pools, gyms, courts, sauna, and more.", emojis: "🏃🏀😜"),
    Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "Open playing fields and courts perfect for engaging in team sports and other large group activities.", emojis: "🌲⛹😛"),
    Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "Also called CRCE, this rec center offers multiple courts, an indoor track, aquatic center, and more.", emojis: "⛹🏸🙂"),
    Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "The third-oldest park in the Urbana Park district, featuring a dolphin fountain and two-story stone pavilion.", emojis: "🏞🐬😌"),
    Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "The park features the district's only lighted tennis courts and is also used for soccer, T-ball and Kiwanis Little League baseball.", emojis: "⚽🏞🙂"),
    Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "The park features an urban forest, scenic parkway drive, Lake House, playground, Aquatic Center, and more.", emojis: "🌊🌲☺️"),
    Space(name: "Douglass Park", lat: 40.124425, long: -88.230837, desc: "City park with a playground, seasonal splash pad & fitness course, plus baseball fields & a grill.", emojis: "⚾🏞🙂"),
    Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "Located in the heart of downtown Urbana, this public library offers books/ebooks,, DVDs, CDs, family events, and more.", emojis: ""),
    Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "The University's historic library that features rare and notable collections, books, and manuscripts.", emojis: "📚📝😐"),
    Space(name: "Funk ACES Library", lat: 40.102836, long: -88.225100, desc: "Campus library that supports research for Agricultural, Consumer and Environmental Sciences (ACES).", emojis: "🚜📚😐"),
    Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "Children's museum featuring interactive educational exhibits that promote an exploration of the sciences and arts.", emojis: "🔬📖😀"),
    Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "Campus library that provides academic services, technology, collections, and environments to enhance collaboration and exploration.", emojis: "📚💻😓"),
    Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "An open and collaborative workshop space for computer-driven innovation, design and fabrication.", emojis: "🔨🖨😀"),
    Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "Formerly known as Mini Park VII, this small park features beautiful flowerbeds and a large peacock statue.", emojis: "🌺🌿🙂"),
    Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "Initially established as Urbana’s first pioneer and Indian cemetery, this park features many oak varieties.", emojis: "🌲🍂🙂"),
    Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "This park features open fields, grills, tennis courts, a playground, and pavilion.", emojis: "🌿🏓😛"),
    Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "These 3 round barns are used for research and instructions, and played a historical role in the promotion of the American round barn.", emojis: "🚜🐓😐"),
    Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "This park features include a farmstead, walking trails, Tree Grove, organic garden plots, and the district's largest play structure.", emojis: "🌳🚶🙂"),
    Space(name: "Grainger Engineering Library", lat: 40.1125, long: -88.2269, desc: "Library dedicated to all disciplines of engineering at the University.", emojis: "🖥📘😖"),
    Space(name: "Alma Mater", lat: 40.109901, long: -88.228384, desc: "Bronze statue by sculptor Lorado Taft, a beloved symbol of the university and representation of the University's motto, \"Learning and Labor\".", emojis: "🙌💁😊")
]

var dict: [String:Space] = [
    "Spurlock Museum":Space(name: "Spurlock Museum", lat: 40.107842, long: -88.220805, desc: "Ethnographic museum featuring over 51,000 cultural and historical artifacts, celebrating diversity of cultures through time and across the globe.", emojis: "🏛📚🙂"),
    "Champaign Public Library":Space(name: "Champaign Public Library", lat: 40.111536, long: -88.246042, desc: "Champaign Public Library offers books, DVDs, CDs, ebooks, streaming music & movies, family events, a bookstore, cafe, and more.", emojis: "📕📚😌"),
    "Krannert Center for the Performing Arts":Space(name: "Krannert Center for the Performing Arts", lat: 40.108031, long: -88.222956, desc: "Educational and performing arts complex for the University of Illinois. Catch a classical concert or theatrical performance in one of their five theaters!", emojis: "🎭🎻🙂"),
    "Krannert Art Museum":Space(name: "Krannert Art Museum", lat: 40.101919, long: -88.231823, desc: "Vibrant exchange of ideas in the visual arts, with a permanent collection that contains more than 10,000 works of art.", emojis: "🎨🖌😊"),
    "Hessel Park":Space(name: "Hessel Park", lat: 40.099588, long: -88.250334, desc: "Public park with 25 different tree varieties, playground, and splash pad.", emojis: "🏞💦😌"),
    "Florida and Lincoln Playing Field":Space(name: "Florida and Lincoln Playing Field", lat: 40.096895, long: -88.221152, desc: "Open playing fields perfect for engaging in team sports or other large group activities.", emojis: "🌱🏑😜"),
    "University of Illinois Arboretum":Space(name: "University of Illinois Arboretum", lat: 40.093756, long: -88.216329, desc: "University's 57-acre arboretum houses multiple gardens that facilitate teaching, research, and public service programs. Facilities include the Idea Garden, Japan House, and more.", emojis: "🌲🌻😌"),
    "Japan House":Space(name: "Japan House", lat: 40.092807, long: -88.217965, desc: "Celebrates the study of Japanese aesthetics and traditional arts, and offers a place of tranquility and cultural understanding. Japan House is built particularly around the time-honored art form of Chado, the Way of Tea.", emojis: "🏯🌸🙂"),
    "Stanley Illini Grove":Space(name: "Stanley Illini Grove", lat: 40.101666, long: -88.220084, desc: "Illini Grove houses facilities that encourage outdoor activities and get-togethers, such as basketball/tennis/volleyball courts and picnic sites.", emojis: "🌳🎾😛"),
    "Dorner Drive Playing Fields":Space(name: "Dorner Drive Playing Fields", lat: 40.102539, long: -88.221237, desc: "Open playing fields and tennis courts perfect for team sports and other large group activities.", emojis: "🏓🍃😀"),
    "University of Illinois Observatory":Space(name: "University of Illinois Observatory", lat: 40.105248, long: -88.226100, desc: "The University's historic observatory, open frequently for public viewing sessions and open houses.", emojis: "🌑🔭🙂"),
    "UI Ice Arena":Space(name: "UI Ice Arena", lat: 40.105998, long: -88.232371, desc: "Also known as the Big Pond, the Ice Arena offers instructional ice skating programs, public skating sessions, intramural sports leagues, club activities, and more!", emojis: "⛸🏒😃"),
    "Washington Park":Space(name: "Washington Park", lat: 40.106830, long: -88.236174, desc: "This park is home to a basketball court, two volleyball courts, a picnic area, outdoor grills, and an outdoor water fountain.", emojis: "🏞🏐😊"),
    "Scott Park":Space(name: "Scott Park", lat: 40.111863, long: -88.236195, desc: "This park features a playground, basketball court, walking path, and a covered picnic area with outdoor grills and drinking fountains.", emojis: "🏀👣😜"),
    "Main Quad":Space(name: "Main Quad", lat: 40.107539, long: -88.227187, desc: "The heart of campus, the Main Quad is an open space to relax, play games, and socialize.", emojis: "🍃🐿☺️"),
    "South Quad":Space(name: "South Quad", lat: 40.103503, long: -88.227206, desc: "Open area between Mumford Hall and David Kinley Hall that is home to the iconic South Quad Bell Tower.", emojis: "🔔🐿🙂"),
    "Bardeen Quadrangle":Space(name: "Bardeen Quadrangle", lat: 40.111636, long: -88.227069, desc: "The engineering quadrangle, stretching from Engineering Hall to the Grainger Engineering Library, dedicated in honor of John Bardeen.", emojis: "🍃🐿☺️"),
    "Activities and Recreation Center":Space(name: "Activities and Recreation Center", lat: 40.100848, long: -88.235995, desc: "One of the country's largest campus recreation centers, with amenities such as a climbing wall, swimming pools, gyms, courts, sauna, and more.", emojis: "🏃🏀😜"),
    "Stadium Terrace Playing Field":Space(name: "Stadium Terrace Playing Field", lat: 40.102269, long: -88.240127, desc: "Open playing fields and courts perfect for engaging in team sports and other large group activities.", emojis: "🌲⛹😛"),
    "Campus Recreation Center East":Space(name: "Campus Recreation Center East", lat: 40.104773, long: -88.221912, desc: "Also called CRCE, this rec center offers multiple courts, an indoor track, aquatic center, and more.", emojis: "⛹🏸🙂"),
    "Carle Park":Space(name: "Carle Park", lat: 40.103792, long: -88.212122, desc: "The third-oldest park in the Urbana Park district, featuring a dolphin fountain and two-story stone pavilion.", emojis: "🏞🐬😌"),
    "Blair Park":Space(name: "Blair Park", lat: 40.099643, long: -88.206119, desc: "The park features the district's only lighted tennis courts and is also used for soccer, T-ball and Kiwanis Little League baseball.", emojis: "⚽🏞🙂"),
    "Crystal Lake Park":Space(name: "Crystal Lake Park", lat: 40.120418, long: -88.211526, desc: "The park features an urban forest, scenic parkway drive, Lake House, playground, Aquatic Center, and more.", emojis: "🌊🌲☺️"),
    "Douglass Park":Space(name: "Douglass Park", lat: 40.124425, long: -88.230837, desc: "City park with a playground, seasonal splash pad & fitness course, plus baseball fields & a grill.", emojis: "⚾🏞🙂"),
    "Urbana Free Library":Space(name: "Urbana Free Library", lat: 40.111256, long: -88.209587, desc: "Located in the heart of downtown Urbana, this public library offers books/ebooks,, DVDs, CDs, family events, and more.", emojis: "📚📖😊"),
    "Main Library":Space(name: "Main Library", lat: 40.104737, long: -88.228892, desc: "The University's historic library that features rare and notable collections, books, and manuscripts.", emojis: "📚📝😐"),
    "Funk ACES Library":Space(name: "Funk ACES Library", lat: 40.102836, long: -88.225100, desc: "Campus library that supports research for Agricultural, Consumer and Environmental Sciences (ACES).", emojis: "🚜📚😐"),
    "Orpheum Children's Science Museum":Space(name: "Orpheum Children's Science Museum", lat: 40.119456, long: -88.242456, desc: "Children's museum featuring interactive educational exhibits that promote an exploration of the sciences and arts.", emojis: "🔬📖😀"),
    "Undergraduate Library":Space(name: "Undergraduate Library", lat: 40.104679, long: -88.227175, desc: "Campus library that provides academic services, technology, collections, and environments to enhance collaboration and exploration.", emojis: "📚💻😓"),
    "Champaign-Urbana Community Fab Lab":Space(name: "Champaign-Urbana Community Fab Lab", lat: 40.102046, long: -88.224709, desc: "An open and collaborative workshop space for computer-driven innovation, design and fabrication.", emojis: "🔨🖨😀"),
    "McCollum Park":Space(name: "McCollum Park", lat: 40.105008, long: -88.243181, desc: "Formerly known as Mini Park VII, this small park features beautiful flowerbeds and a large peacock statue.", emojis: "🌺🌿🙂"),
    "Leal Park":Space(name: "Leal Park", lat: 40.115947, long: -88.210445, desc: "Initially established as Urbana’s first pioneer and Indian cemetery, this park features many oak varieties.", emojis: "🌲🍂🙂"),
    "King Park":Space(name: "King Park", lat: 40.121902, long: -88.221352, desc: "This park features open fields, grills, tennis courts, a playground, and pavilion.", emojis: "🌿🏓😛"),
    "University of Illinois Round Barns":Space(name: "University of Illinois Round Barns", lat: 40.093915, long: -88.224830, desc: "These 3 round barns are used for research and instructions, and played a historical role in the promotion of the American round barn.", emojis: "🚜🐓😐"),
    "Meadowbrook Park":Space(name: "Meadowbrook Park", lat: 40.082213, long: -88.206175, desc: "This park features include a farmstead, walking trails, Tree Grove, organic garden plots, and the district's largest play structure.", emojis: "🌳🚶🙂"),
    "Grainger Engineering Library":Space(name: "Grainger Engineering Library", lat: 40.1125, long: -88.2269, desc: "Library dedicated to all disciplines of engineering at the University.", emojis: "🖥📘😖"),
    "Alma Mater":Space(name: "Alma Mater", lat: 40.109901, long: -88.228384, desc: "Bronze statue by sculptor Lorado Taft, a beloved symbol of the university and representation of the University's motto, \"Learning and Labor\".", emojis: "🙌💁😊")]

class placesAndDistances {
    var name = String()
    var distance = Double()
}
