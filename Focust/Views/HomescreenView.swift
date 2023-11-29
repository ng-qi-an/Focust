//
//  Homescreen.swift
//  Focust
//
//  Created by Ethan Chow on 13/11/23.
//

import SwiftUI

struct HomescreenView: View {
    @Binding var theme: Theme;
    @Binding var page: Int
    @Binding var startedSession: Bool
    @Binding var today: String
    @Binding var token: String;

    @State var value = 0
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack {
                        ZStack {
                            VStack {
                                ZStack {
                                    theme.color.background
                                        .frame(maxWidth: .infinity, maxHeight: 225)
                                    Image("triangles")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 380, height: 191)
                                }
                                Spacer()
                            }.frame(maxWidth: .infinity, maxHeight: 250)
                            VStack {
                                Spacer()
                                Text("**\(Int(today)! / (60 * 60))**")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                                Text("hours focused")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20)) //number of hours focused //bg oval
                                Spacer()
                            }.frame(maxWidth: .infinity, maxHeight: 200)
                            ZStack {
                                VStack {
                                    Ellipse()
                                        .frame(maxWidth: .infinity, maxHeight: 50)
                                        .foregroundColor(theme.gray.background)
                                        .padding(.top, 260)
                                    Spacer()
                                }
                                Rectangle()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .foregroundColor(theme.gray.background)
                                    .padding(.top, 370)
                            }.frame(maxWidth: .infinity, maxHeight: 250)
                        }
                        Spacer()
                    }
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    VStack {
                        HStack {
                            VStack {
                                Button {
                                    page = 3
                                } label: {
                                    Circle()
                                        .fill(theme.gray.surface2)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "gearshape")
                                                .font(.system(size: 17))
                                                .foregroundColor(theme.gray.foreground)
                                                .offset(y: -0.5))
                                        .shadow(color: theme.gray.shadow, radius: 2, x: 0, y: 1)
                                }//frien button
                                Text("Account")
                                    .font(.system(size: 15))
                                    .foregroundColor(theme.gray.foreground)
                                    .opacity(0.5)
                            }.offset(x: -25, y: -50)
                            NavigationLink {
                                Focus_ModeView(theme : $theme, startedSession: $startedSession, token: $token, today: $today)
                            } label: {
                                Circle()
                                    .fill(theme.color.button)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        Image(systemName: "triangle.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                            .offset(x: -2.5, y: -3)
                                            .rotationEffect(.degrees(-30)))
                                    .offset(y: -60)
                            } //start button
                            VStack {
                                Button {
                                    page = 2
                                } label: {
                                    Circle()
                                        .fill(theme.gray.surface2)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "chart.line.uptrend.xyaxis")
                                                .font(.system(size: 17))
                                                .foregroundColor(theme.gray.foreground)
                                                .offset(y: -0.5))
                                        .shadow(color: theme.gray.shadow, radius: 2, x: 0, y: 1)
                                } //stats button
                                Text("Stats")
                                    .font(.system(size: 15))
                                    .foregroundColor(theme.gray.foreground)
                                    .opacity(0.5)
                            }.offset(x: 25, y: -50)
                        }
                        .offset(y: 100)
//                        HStack {
//                            Text("🏁")
//                                .font(.system(size: 15))
//                            ZStack {
//                                Rectangle()
//                                    .frame(width: 270, height: 10)
//                                    .cornerRadius(20)
//                                    .foregroundColor(theme.gray.surface1)
//                                    .shadow(color: theme.gray.shadow, radius: 2, x: 0, y: 1)
//                                Rectangle()
//                                    .frame(width: 90, height: 10)
//                                    .cornerRadius(20)
//                                    .foregroundColor(theme.color.button)
//                                    .offset(x: -90)
//                            }
//                            Text("🎉")
//                                .font(.system(size: 15))
//                        }.offset(x: 3, y: 65) //time left
//                        Text("[ ] hrs left") //text version of time left
//                            .opacity(0.5)
//                            .offset(y: 65)
//                            .foregroundColor(theme.gray.foreground)
                    }
                    .offset(y: 10)
                    .padding(.top, 200)
                    .padding(.bottom, 120)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView(theme: .constant(Theme()), page: .constant(1), startedSession: .constant(false), today: .constant("0"), token: .constant("094392432hh23r"))
    }
}
