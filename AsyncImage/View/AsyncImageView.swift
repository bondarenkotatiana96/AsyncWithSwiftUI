//
//  ContentView.swift
//  AsyncImage
//
//  Created by Tatiana Bondarenko on 2/9/23.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        NavigationView {
            VStack {

                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg")!) { image in
                    image.resizable().frame(width: 300, height: 300, alignment: .center)
                } placeholder: {
                    ProgressView()
                }


                List(superheroArray) { hero in
                    Text(hero.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                }
            }
        }.navigationTitle("Superheroes")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
