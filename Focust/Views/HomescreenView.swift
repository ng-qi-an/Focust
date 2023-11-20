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
    
    @State var value = 0
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack {
                        ZStack {
                            VStack {
                                theme.color.background
                                    .frame(maxWidth: .infinity, maxHeight: 225)
                                    .background(theme.color.background)
                                Spacer()
                            }.frame(maxWidth: .infinity, maxHeight: 250)
                            VStack {
                                Spacer()
                                Text("**1**")
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
                                    page = 2
                                } label: {
                                    Circle()
                                        .fill(theme.gray.surface2)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "person.2.fill")
                                                .font(.system(size: 17))
                                                .foregroundColor(theme.gray.foreground)
                                                .offset(y: -0.5))
                                        .shadow(color: theme.gray.shadow, radius: 2, x: 0, y: 1)
                                }//frien button
                                Text("Friends")
                                    .font(.system(size: 15))
                                    .foregroundColor(theme.gray.foreground)
                                    .opacity(0.5)
                            }.offset(x: -25, y: -50)
                            NavigationLink {
                                Focus_ModeView(theme : $theme)
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
                                    page = 3
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
                        HStack {
                            Text("🏁")
                                .font(.system(size: 15))
                            ZStack {
                                Rectangle()
                                    .frame(width: 270, height: 10)
                                    .cornerRadius(20)
                                    .foregroundColor(theme.gray.surface1)
                                    .shadow(color: theme.gray.shadow, radius: 2, x: 0, y: 1)
                                Rectangle()
                                    .frame(width: 90, height: 10)
                                    .cornerRadius(20)
                                    .foregroundColor(theme.color.button)
                                    .offset(x: -90)
                            }
                            Text("🎉")
                                .font(.system(size: 15))
                        }.offset(x: 3, y: 65) //time left
                        Text("[ ] hrs left") //text version of time left
                            .opacity(0.5)
                            .offset(y: 65)
                            .foregroundColor(theme.gray.foreground)
                        Text("**Your activity**")
                            .opacity(0.5)
                            .offset(x: -120, y: 90) //your activity
                            .foregroundColor(theme.gray.foreground)
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 270)
                                .foregroundColor(theme.gray.surface1) //streak bg
                                .cornerRadius(15)
                            Image("flame")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .offset(y: -65) //fire
                            Text("**5**")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .offset(y: -50) //streak number
                            Text("**Day Streak**")
                                .font(.system(size: 20))
                                .opacity(0.6)
                                .offset(y: 10)
                                .foregroundColor(theme.gray.foreground)
                            VStack {
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: theme.mode == .Dark ? [
                                            theme.yellow.foreground,
                                            theme.yellow.foreground,
                                        ] : [
                                            theme.yellow.button,
                                            theme.orange.button,
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
                                        colors: theme.mode == .Dark ? [
                                            theme.yellow.foreground,
                                            theme.yellow.foreground,
                                        ] : [
                                            theme.yellow.button,
                                            theme.orange.button,
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
                                            .foregroundColor(theme.gray.surface3)
                                            .offset(y: 70)
                                        ZStack {
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: theme.mode == .Dark ? [
                                                        theme.yellow.foreground,
                                                        theme.yellow.foreground,
                                                    ] : [
                                                        theme.yellow.button,
                                                        theme.orange.button,
                                                    ]
                                                ),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .mask(Circle())
                                            .frame(width: 15, height: 15)
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(theme.gray.background)
                                                .opacity(1)
                                        }.offset(x: -120, y: 70)
                                        ZStack {
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: theme.mode == .Dark ? [
                                                        theme.yellow.foreground,
                                                        theme.yellow.foreground,
                                                    ] : [
                                                        theme.yellow.button,
                                                        theme.orange.button,
                                                    ]
                                                ),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .mask(Circle())
                                            .frame(width: 15, height: 15)
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(theme.gray.background)
                                                .opacity(1)
                                        }.offset(x: -80, y: 70)
                                        ZStack {
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: theme.mode == .Dark ? [
                                                        theme.yellow.foreground,
                                                        theme.yellow.foreground,
                                                    ] : [
                                                        theme.yellow.button,
                                                        theme.orange.button,
                                                    ]
                                                ),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .mask(Circle())
                                            .frame(width: 15, height: 15)
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(theme.gray.background)
                                                .opacity(1)
                                        }.offset(x: -40, y: 70)
                                        ZStack {
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: theme.mode == .Dark ? [
                                                        theme.yellow.foreground,
                                                        theme.yellow.foreground,
                                                    ] : [
                                                        theme.yellow.button,
                                                        theme.orange.button,
                                                    ]
                                                ),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .mask(Circle())
                                            .frame(width: 15, height: 15)
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(theme.gray.background)
                                                .opacity(1)
                                        }.offset(y: 70)
                                        ZStack {
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: theme.mode == .Dark ? [
                                                        theme.yellow.foreground,
                                                        theme.yellow.foreground,
                                                    ] : [
                                                        theme.yellow.button,
                                                        theme.orange.button,
                                                    ]
                                                ),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                            .mask(Circle())
                                            .frame(width: 15, height: 15)
                                            Circle()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(theme.gray.background)
                                                .opacity(0)
                                        }.offset(x: 40, y: 70)
                                        ZStack {
                                            if value == 0 {
                                                Circle()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundColor(theme.gray.surface4)
                                                Circle()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(theme.gray.background)
                                                    .opacity(1)
                                            } else {
                                                LinearGradient(
                                                    gradient: Gradient(
                                                        colors: theme.mode == .Dark ? [
                                                            theme.yellow.foreground,
                                                            theme.yellow.foreground,
                                                        ] : [
                                                            theme.yellow.button,
                                                            theme.orange.button,
                                                        ]
                                                    ),
                                                    startPoint: .top,
                                                    endPoint: .bottom
                                                )
                                                .mask(Circle())
                                                .frame(width: 15, height: 15)
                                                Circle()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(theme.gray.background)
                                                    .opacity(1)
                                            }
                                        }.offset(x: 80, y: 70)
                                        ZStack {
                                            if value == 0 {
                                                Circle()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundColor(theme.gray.surface4)
                                                Circle()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(theme.gray.background)
                                                    .opacity(1)
                                            } else {
                                                LinearGradient(
                                                    gradient: Gradient(
                                                        colors: theme.mode == .Dark ? [
                                                            theme.yellow.foreground,
                                                            theme.yellow.foreground,
                                                        ] : [
                                                            theme.yellow.button,
                                                            theme.orange.button,
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
                                    }.offset(y: -20) //timeline
                                    HStack {
                                        Text("M")
                                            .font(.system(size: 15))
                                            .offset(x: -65, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("T")
                                            .font(.system(size: 15))
                                            .offset(x: -45, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("W")
                                            .font(.system(size: 15))
                                            .offset(x: -25, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("T")
                                            .font(.system(size: 15))
                                            .offset(x: -5, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("F")
                                            .font(.system(size: 15))
                                            .offset(x: 17, y: 90)
                                            .opacity(1)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("S")
                                            .font(.system(size: 15))
                                            .offset(x: 42, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("S")
                                            .font(.system(size: 15))
                                            .offset(x: 65, y: 90)
                                            .opacity(0.5)
                                            .foregroundColor(theme.gray.foreground)
                                    }//days of the week
                                    .offset(y: -40)
                                    .foregroundColor(.black)
                                }
                            }
                        }.offset(y: 90)
                    }
                    .offset(y: 10)
                    .padding(.top, 200)
                    .padding(.bottom, 120)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView(theme: .constant(Theme()), page: .constant(1))
    }
}
