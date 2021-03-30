//
//  ContentView.swift
//  webImage
//
//  Created by 彭智鑫 on 2021/3/30.
//

import SwiftUI

private var url = URL(string: "https://avatars.githubusercontent.com/u/24643457?v=4")

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SimpleExample(url: url)) {
                    Text("Single Example")
                }
                NavigationLink(destination: WebImageExample(url: url)){
                    Text("Web Image Example")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
