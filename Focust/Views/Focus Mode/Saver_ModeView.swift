//
//  Saver_ModeView.swift
//  Focust
//
//  Created by Ethan Chow on 22/11/23.
//

import SwiftUI

struct Saver_ModeView: View {
    
    @Binding var hour: Int
    @Binding var min: Int
    @Binding var saver: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(.black), Color(.black), Color(.black), RGBtoColor(23, 37, 84)], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("triangles")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 191)
                Spacer()
            }
            VStack {
                Spacer()
                HStack(spacing: 25) {
                    VStack(spacing: -20) {
                        Text("**\(hour)**")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .opacity(0.5)
                        Text("hr")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    Text(" **:** ")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                        .opacity(0.5)
                    VStack(spacing: -20) {
                        Text("**\(min < 10 ? "0" : "")\(min)**")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                            .opacity(0.5)
                        Text("minutes")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                }
                Spacer()
                Text("Click anywhere to exit saver mode")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.bottom, 40)
                    .padding(.top, 100)
            }
        }
        .onTapGesture {
            saver = false
        }
    }
}

struct Saver_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Saver_ModeView(hour: .constant(0), min: .constant(0), saver: .constant(true))
    }
}


