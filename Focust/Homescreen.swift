//
//  Homescreen.swift
//  Focust
//
//  Created by Ethan Chow on 13/11/23.
//

import SwiftUI

struct Homescreen: View {
    var body: some View {
        ZStack {
            Color(red: 45/255, green: 212/255, blue: 191/255).edgesIgnoringSafeArea(.all)
            
            VStack {
                Rectangle().frame(height: 650).offset(y: 114.0).foregroundColor(.white)
            }
            VStack {
                HStack {
                    Button {
                        //
                    } label: {
                        Circle()
                            .fill(Color(red: 242/255, green: 242/255, blue: 242/255))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 17))
                                    .foregroundColor(.black)
                                    .offset(y: -0.5))
                            .offset(x: 15, y: -60 )
                        Text("Friends")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                            .offset(x: -35, y: -20)
                    }
                    Button {
                        //
                    } label: {
                        Circle()
                            .fill(Color(red: 45/255, green: 212/255, blue: 191/255))
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "triangle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .offset(x: -2.5, y: -3)
                                    .rotationEffect(.degrees(-30)))
                            .offset(y: -60)
                    }
                    Button {
                        //
                    } label: {
                        Circle()
                            .fill(Color(red: 242/255, green: 242/255, blue: 242/255))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .font(.system(size: 17))
                                    .foregroundColor(.black)
                                    .offset(y: -0.5))
                            .offset(x: 25, y: -60)
                        Text("Stats")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                            .offset(x: -20, y: -20)
                    }
                }
                .offset(y: -20)
            }
        }
    }
}

#Preview {
    Homescreen()
}
