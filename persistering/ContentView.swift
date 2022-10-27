//
//  ContentView.swift
//  persistering
//
//  Created by ksd on 25/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("magnitude") private var mag: Double?
    
    @State var earthquakes = TestData.earthquakes.filter { earthquake in
        earthquake.properties.mag > 0
    }
    
    var body: some View {
        List {
            ForEach(earthquakes) { earthquake in
                Text(earthquake.properties.place)
            }
        }.onAppear(){
            mag = 3
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
