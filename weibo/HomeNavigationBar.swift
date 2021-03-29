//
//  HomeNavigationBar.swift
//  weibo
//
//  Created by 彭智鑫 on 2021/3/27.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    @Binding var letfPercent: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("Click camera button")
            }){
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }

            Spacer()

            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - (self.letfPercent * 0.5)))
                        .onTapGesture {
                            withAnimation {
                                self.letfPercent = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + self.letfPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.letfPercent = 1
                            }
                        }
                }
                .font(.system(size: 20))

                GeometryReader {geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width / 2 - 15)
                        .offset(x: geometry.size.width * (self.letfPercent - 0.5) + kLabelWidth * (0.5 - self.letfPercent))
                }
                .frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)

            Spacer()

            Button(action: {
                print("Click camera button")
            }){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }

        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(letfPercent: .constant(0))
    }
}
