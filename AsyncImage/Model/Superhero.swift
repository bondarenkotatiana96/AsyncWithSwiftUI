//
//  Superhero.swift
//  AsyncImage
//
//  Created by Tatiana Bondarenko on 2/9/23.
//

import Foundation

struct Superhero: Identifiable {
    var id = UUID()
    var name: String
}

let superman = Superhero(name: "Superman")
let batman = Superhero(name: "Batman")
let spiderman = Superhero(name: "Spiderman")

let superheroArray = [superman, batman, spiderman]
