//
//  PostListView.swift
//  weibo
//
//  Created by 彭智鑫 on 2021/3/26.
//

import SwiftUI
import BBSwiftUIKit

struct PostListView: View {
    let category: PostListCategory
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        BBTableView(userData.postList(for: category).list) {post in
            NavigationLink(destination: PostDetailView(post: post)) {
                PostCell(post: post)
            }
            .buttonStyle(OriginalButtonStyle())
        }
        .bb_setupRefreshControl({ (control) in
            control.attributedTitle = NSAttributedString(string: "加载中")
        })
        .bb_pullDownToRefresh(isRefreshing: $userData.isRefreshing) {
            self.userData.refreshPostList(for: self.category)
        }
        .bb_pullUpToLoadMore(bottomSpace: 30) {
            self.userData.loadMorePostList(for: self.category)
        }
        .bb_reloadData($userData.relaodData)
        .onAppear {
            self.userData.loadPostListIfNeeded(for: self.category)
        }
        .overlay(
            Text(userData.loadingErrorText)
                .bold()
                .frame(width: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .opacity(0.8)
                )
                .animation(nil)
                .scaleEffect(userData.showLoadingError ? 1 : 0.5)
                .animation(.spring(dampingFraction: 0.5))
                .opacity(userData.showLoadingError ? 1 : 0)
                .animation(.easeInOut)
        )
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .navigationTitle("Title")
                .navigationBarHidden(true)
                .environmentObject(UserData.testData)
        }
    }
}
