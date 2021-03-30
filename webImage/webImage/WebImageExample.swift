//
//  WebImageExample.swift
//  webImage
//
//  Created by 彭智鑫 on 2021/3/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct WebImageExample: View {
    let url: URL?
    
    var body: some View {
        WebImage(url: url)
            .placeholder { Color.gray }
            .resizable()
            .onSuccess(perform: { (_, _, _) in
                print("Success")
                SDWebImageManager.shared.imageCache.clear(with: .all, completion: nil)
            })
            .onFailure(perform: { (_) in
                print("Failure")
            })
            .scaledToFill()
            .frame(height: 600)
            .clipped()
    }
}
