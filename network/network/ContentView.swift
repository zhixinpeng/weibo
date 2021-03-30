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
        NetworkAPI.recommentPostList { (result) in
            switch result {
            case let .success(list): self.updateText("Post count \(list.list.count)")
            case let .failure(error): self.updateText(error.localizedDescription)
            }
        }
        
//        NetworkManager.shared.requestGet(path: "PostListData_hot_1.json", parameters: nil) { (result) in
//            switch result {
//            case let .success(data):
//                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
//                    self.updateText("Can not parse data")
//                    return
//                }
//                self.updateText("Post count: \(list.list.count)")
//            case let .failure(error):
//                self.updateText(error.localizedDescription)
//            }
//        }
        
//        AF.request(url).responseData { (response) in
//            switch response.result {
//            case let .success(data):
//                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
//                    self.updateText("Can not parse data")
//                    return
//                }
//
//                self.updateText("Post count: \(list.list.count)")
//                break
//            case let.failure(error):
//                self.updateText(error.localizedDescription)
//                break
//            }
//        }
//        var request = URLRequest(url: url)
//        request.timeoutInterval = 15
//        request.httpMethod = "POST"
//        let dic = ["key": "value"]
//        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
//        request.httpBody = data
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                self.updateText(error.localizedDescription)
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                self.updateText("Invalid response")
//                return
//            }
//
//            guard let data = data else {
//                self.updateText("No data")
//                return
//            }
//
//            guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
//                self.updateText("Can not parse data")
//                return
//            }
//
//            self.updateText("Post count: \(list.list.count)")
//        }
//        task.resume()
    }
    
    func updateText(_ text: String) {
        self.text = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
