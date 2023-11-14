//
//  Homescreen.swift
//  Focust
//
//  Created by Ethan Chow on 13/11/23.
//

import SwiftUI

struct Homescreen: View {
    
    @State var value = 0
    var body: some View {
        ZStack {
            Color(red: 45/255, green: 212/255, blue: 191/255)
                .edgesIgnoringSafeArea(.all)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(88))
                .offset(x: -100, y: -270)
                .foregroundColor(.white)
                .opacity(0.3)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(-60))
                .offset(x: -170, y: -360)
                .foregroundColor(.white)
                .opacity(0.4)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(81))
                .offset(x: -50, y: -380)
                .foregroundColor(.white)
                .opacity(0.3)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(-11))
                .offset(x: 80, y: -340)
                .foregroundColor(.white)
                .opacity(0.3)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(151))
                .offset(x: 150, y: -260)
                .foregroundColor(.white)
                .opacity(0.2)
            Image(systemName: "triangle")
                .font(.system(size: 24))
                .rotationEffect(.degrees(-151))
                .offset(x: 150, y: -400)
                .foregroundColor(.white)
                .opacity(0.2)
            Ellipse()
                .frame(width: 395, height: 50)
                .offset(y: -210)
                .foregroundColor(.white)
                .shadow(color: .white, radius: 5, y: -5)
            VStack {
                Text("**1**")
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                Text("hours focused")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Rectangle()
                    .frame(height: 650)
                    .offset(y: 60)
                    .foregroundColor(.white)
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
                        Rectangle()
                            .frame(width: 270, height: 10)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                            .shadow(color: Color(.lightGray), radius: 2, x: 0, y: 1)
                        Rectangle()
                            .frame(width: 90, height: 10)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255))
                            .offset(x: -90)
                    }
                    Text("🎉")
                        .font(.system(size: 15))
                }.offset(x: 3, y: -100)
                Text("[ ] hrs left")
                    .opacity(0.3)
                    .offset(y: -90)
                Text("**Your activity**")
                    .opacity(0.5)
                    .offset(x: -120)
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 290)
                        .foregroundColor(Color(red: 242/255, green: 242/255, blue: 242/255))
                        .cornerRadius(15)
                    Image("flame")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .offset(y: -65)
                    Text("[ ]")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .offset(y: -50)
                    Text("**Day Streak**")
                        .font(.system(size: 20))
                        .opacity(0.6)
                        .offset(y: 10)
                    VStack {
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(red: 250/255, green: 204/255, blue: 21/255),
                                    Color(red: 249/255, green: 115/255, blue: 22/255)
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(Image(systemName: "trophy.fill"))
                        .frame(width: 26, height: 28)
                        .offset(x: 120, y: 85)
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    Color(red: 250/255, green: 204/255, blue: 21/255),
                                    Color(red: 249/255, green: 115/255, blue: 22/255)
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(Image(systemName: "flag.checkered"))
                        .frame(width: 26, height: 28)
                        .offset(x: -120, y: 50)
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 230, height: 3)
                                    .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                                    .offset(y: 70)
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(red: 250/255, green: 204/255, blue: 21/255),
                                                Color(red: 249/255, green: 115/255, blue: 22/255)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }.offset(x: -120, y: 70)
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(red: 250/255, green: 204/255, blue: 21/255),
                                                Color(red: 249/255, green: 115/255, blue: 22/255)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }.offset(x: -80, y: 70)
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(red: 250/255, green: 204/255, blue: 21/255),
                                                Color(red: 249/255, green: 115/255, blue: 22/255)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }.offset(x: -40, y: 70)
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(red: 250/255, green: 204/255, blue: 21/255),
                                                Color(red: 249/255, green: 115/255, blue: 22/255)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(1)
                                }.offset(y: 70)
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(
                                            colors: [
                                                Color(red: 250/255, green: 204/255, blue: 21/255),
                                                Color(red: 249/255, green: 115/255, blue: 22/255)
                                            ]
                                        ),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    .mask(Circle())
                                    .frame(width: 15, height: 15)
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                        .opacity(0)
                                }.offset(x: 40, y: 70)
                                ZStack {
                                    if value == 0 {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.gray)
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.white)
                                            .opacity(1)
                                    } else {
                                        LinearGradient(
                                            gradient: Gradient(
                                                colors: [
                                                    Color(red: 250/255, green: 204/255, blue: 21/255),
                                                    Color(red: 249/255, green: 115/255, blue: 22/255)
                                                ]
                                            ),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .mask(Circle())
                                        .frame(width: 15, height: 15)
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.white)
                                            .opacity(1)
                                    }
                                }.offset(x: 80, y: 70)
                                ZStack {
                                    if value == 0 {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.gray)
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.white)
                                            .opacity(1)
                                    } else {
                                        LinearGradient(
                                            gradient: Gradient(
                                                colors: [
                                                    Color(red: 250/255, green: 204/255, blue: 21/255),
                                                    Color(red: 249/255, green: 115/255, blue: 22/255)
                                                ]
                                            ),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                        .mask(Circle())
                                        .frame(width: 15, height: 15)
                                        Circle()
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.white)
                                            .opacity(1)
                                    }
                                }.offset(x: 120, y: 70)
                            }.offset(y: -20)
                            HStack {
                                Text("M")
                                    .font(.system(size: 15))
                                    .offset(x: -65, y: 90)
                                    .opacity(0.5)
                                Text("T")
                                    .font(.system(size: 15))
                                    .offset(x: -45, y: 90)
                                    .opacity(0.5)
                                Text("W")
                                    .font(.system(size: 15))
                                    .offset(x: -25, y: 90)
                                    .opacity(0.5)
                                Text("T")
                                    .font(.system(size: 15))
                                    .offset(x: -5, y: 90)
                                    .opacity(0.5)
                                Text("F")
                                    .font(.system(size: 15))
                                    .offset(x: 17, y: 90)
                                    .opacity(1)
                                Text("S")
                                    .font(.system(size: 15))
                                    .offset(x: 42, y: 90)
                                    .opacity(0.5)
                                Text("S")
                                    .font(.system(size: 15))
                                    .offset(x: 65, y: 90)
                                    .opacity(0.5)
                            }.offset(y: -40)
                        }
                    }
                }.offset(y: -70)
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
                }.offset(y: -180)
            }.offset(y: 315)
        }
    }
}

#Preview {
    Homescreen()
}
