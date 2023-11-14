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
            Ellipse().frame(width: 450, height: 118).offset(y: -210).foregroundColor(.white).shadow(color: .white, radius: 5, y: -5)
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
                            .shadow(color: Color(.lightGray), radius: 2, x: 0, y: 1)
                        Text("Friends")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                            .opacity(0.3)
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
                            .shadow(color: Color(.lightGray), radius: 2, x: 0, y: 1)
                        Text("Stats")
                            .font(.system(size: 10))
                            .foregroundColor(.black)
                            .opacity(0.3)
                            .offset(x: -20, y: -20)
                    }
                }
                .offset(y: -70)
                HStack {
                    Text("🏁")
                        .font(.system(size: 15))
                    ZStack {
                        Rectangle().frame(width: 270, height: 10).cornerRadius(20).foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255)).shadow(color: Color(.lightGray), radius: 2, x: 0, y: 1)
                        Rectangle().frame(width: 90, height: 10).cornerRadius(20).foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255)).offset(x: -90)
                    }
                    Text("🎉")
                        .font(.system(size: 15))
                }.offset(x: 3, y: -100)
                Text("[ ] hrs left")
                    .opacity(0.3)
                    .offset(y: -90)
                VStack {
                    Text("**Your activity**")
                        .opacity(0.5)
                        .offset(x: -120)
                    Rectangle().frame(width: 350, height: 271).foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255)).cornerRadius(15)
                }.offset(y: -60)
                HStack {
                    TabView {
                        VStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255))
                            Text("Home")
                                .font(.system(size: 10))
                                .foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255))
                        }.offset(x: 10)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    TabView {
                        VStack {
                            Image(systemName: "person.2.fill")
                                .opacity(0.5)
                            Text("Friends")
                                .font(.system(size: 10))
                                .opacity(0.5)
                        }.offset(x: 5)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    TabView {
                        VStack {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .opacity(0.5)
                            Text("Stats")
                                .font(.system(size: 10))
                                .opacity(0.5)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    TabView {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .opacity(0.5)
                            Text("Settings")
                                .font(.system(size: 10))
                                .opacity(0.5)
                        }.offset(x: -10)
                    }
                    .tabViewStyle(PageTabViewStyle())
                }.offset(y: -150)
            }.offset(y: 300)
        }
    }
}

#Preview {
    Homescreen()
}
