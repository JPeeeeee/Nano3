//
//  ContentView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var collections: CollectionManager = CollectionManager()
    
    var body: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environmentObject(collections)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
