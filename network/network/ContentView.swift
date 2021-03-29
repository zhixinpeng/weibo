//
//  ContentView.swift
//  network
//
//  Created by 彭智鑫 on 2021/3/29.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text).font(.title)

            Button(action: {
                self.startLoad()
            }) {
                Text("Start").font(.largeTitle)
            }
            
            Button(action: {
                self.text = ""
            }) {
                Text("Clear").font(.largeTitle)
            }
        }
    }
    
    func startLoad() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
