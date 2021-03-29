//
//  ContentView.swift
//  weibo
//
//  Created by 彭智鑫 on 2021/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       HomeView()
        .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
