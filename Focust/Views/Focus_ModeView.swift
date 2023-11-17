//
//  Focus Mode.swift
//  Focust
//
//  Created by Ethan Chow on 15/11/23.
//

import SwiftUI

struct Focus_ModeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 45/255, green: 212/255, blue: 191/255), Color(red: 0/255, green: 157/255, blue: 221/255)], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            Image("triangles")
                .resizable()
                .scaledToFit()
                .frame(width: 380, height: 191)
            VStack {
                Spacer()
                VStack {
                    Text("**2 : 20**")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                    HStack {
                        Text("hr")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .padding(.trailing, 70)
                        Text("minutes")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 270, height: 60)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                    Text("finish cl homework")
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .background(.white)
                        .opacity(0.1)
                        .cornerRadius(15)
                    Text("finish cl homework")
                        .foregroundColor(.white)
                }.frame(width: 250, height: 50)
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .background(.white)
                        .opacity(0.1)
                        .cornerRadius(15)
                    Text("finish cl homework")
                        .foregroundColor(.white)
                }.frame(width: 250, height: 50)
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .background(.white)
                        .opacity(0.1)
                        .cornerRadius(15)
                    Text("finish cl homework")
                        .foregroundColor(.white)
                }.frame(width: 250, height: 50)
                Rectangle()
                    .opacity(0)
                    .frame(height: 15)
                Text("add a task")
                    .foregroundColor(.white)
                    .opacity(0.7)
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(red: 239/255, green: 68/255, blue: 86/255))
                        .cornerRadius(20)
                    Image(systemName: "square.fill")
                        .resizable()
                        .frame(width: 35, height: 36)
                        .foregroundColor(.white)
                }
                Spacer()
                HStack {
                    Image(systemName: "leaf")
                    Text("saver mode")
                }
                .frame(width: 155, height: 32)
                .background(.white)
                .cornerRadius(15)
                .padding(.bottom, 10)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 10)
                    .foregroundColor(.white)
            }
        }
    }
}

struct Focus_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_ModeView()
    }
}