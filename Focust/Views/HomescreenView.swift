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
    @Binding var user: User;
    @Binding var authenticated: Bool;

    @State var value = 0
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [theme.color.background.opacity(0.7), theme.gray.background]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    GeometryReader { geometry in
                        VStack(spacing: 20) {
                            HStack {
                                VStack {
                                    
                                }.frame(width: 50, height: 50)
                                    .background(theme.color.background)
                                    .cornerRadius(10)
                                VStack(alignment: .leading) {
                                    Text("Hello, \(user.name)")
                                        .font(.system(size: 18))
                                        .fontWeight(.semibold)
                                    Text("@\(user.lower_name)")
                                        .foregroundColor(theme.gray.foreground)
                                        .opacity(0.7)
                                }
                                Spacer()
                                if user.guest == false {
                                    Button {
                                        page = 3
                                    } label: {
                                        Image(systemName: "gearshape")
                                            .frame(width: 50, height: 50)
                                            .background(theme.gray.surface1)
                                            .cornerRadius(10)
                                            .foregroundColor(theme.gray.foreground)
                                    }
                                }
                                
                            }.padding(.top, 20)
                                .padding(.bottom, 20)
                            if user.guest == false {
                                VStack(alignment: .center, spacing: 0) {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Your goal for today")
                                                .font(.system(size: 22))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Text("Seize your objective")
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                        Button {
                                            page = 3
                                        } label: {
                                            Image(systemName: "arrow.forward")
                                                .frame(width: 50, height: 50)
                                                .background(theme.gray.surface1)
                                                .cornerRadius(10)
                                                .foregroundColor(theme.gray.foreground)
                                        }
                                    }
                                    Spacer()
                                    ZStack {
                                        GeometryReader { geometry in
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(theme.gray.surface1)
                                                .opacity(0.2)
                                                .frame(width: geometry.size.width, height: 10)
                                            Rectangle()
                                                .foregroundColor(theme.gray.surface1)
                                                .cornerRadius(10)
                                                .frame(width: geometry.size.width * (Double(today)! / Double(user.goal)), height: 10)
                                        }.frame(height: 10)
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, minHeight: 120)
                                .background(theme.color.background)
                                .cornerRadius(10)
                                HStack {
                                    VStack {
                                        HStack {
                                            Text("Today's Time")
                                                .font(.system(size: 15))
                                                .opacity(0.5)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 15))
                                                .opacity(0.5)
                                        }
                                        Spacer()
                                        Text("\(Int(today)! / (60 * 60))")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                        Text("hr")
                                        Spacer()
                                    }.padding()
                                        .frame(width: (geometry.size.width - 20) / 2, height: (geometry.size.width - 20) / 2)
                                        .background(theme.gray.surface1)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            page = 2
                                        }
                                    
                                    VStack {
                                        HStack {
                                            Text("Your Goal")
                                                .font(.system(size: 15))
                                                .opacity(0.5)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 15))
                                                .opacity(0.5)
                                        }
                                        Spacer()
                                        Text("\(user.goal / (60 * 60))")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                        Text("hr")
                                        Spacer()
                                    }.padding()
                                        .frame(width: (geometry.size.width - 20) / 2, height: (geometry.size.width - 20) / 2)
                                        .background(theme.gray.surface1)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            page = 3
                                        }
                                    
                                }.frame(maxWidth: .infinity)
                            } else {
                                VStack {
                                    Text("Guest Account")
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                    Text("In order to save and view statistical data, an active account is required.")
                                        .multilineTextAlignment(.center)
                                    }
                                    .padding()
                                    .frame(height: 300)
                            }
                            NavigationLink {
                                Focus_ModeView(theme: $theme, startedSession: $startedSession, user: $user, token: $token, today: $today)
                            } label: {
                                HStack(spacing: 10) {
                                    VStack {
                                        Image(systemName: "play.fill")
                                            .foregroundColor(.white)
                                    }.frame(width: 50, height: 50)
                                        .background(theme.color.background)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading) {
                                        Text("Start Session")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                            .foregroundColor(theme.gray.foreground)
                                        Text("Begin a distraction-free environment")
                                            .font(.system(size: 14))
                                            .foregroundColor(theme.gray.foreground)
                                            .opacity(0.7)
                                    }
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 15))
                                        .foregroundColor(theme.gray.foreground)
                                        .opacity(0.5)
                                }.padding()
                                    .background(theme.gray.surface1)
                                    .cornerRadius(10)
                            }
                            if user.guest == false {
                                HStack(spacing: 10) {
                                    VStack {
                                        Image(systemName: "chart.line.uptrend.xyaxis")
                                            .foregroundColor(.white)
                                    }.frame(width: 50, height: 50)
                                        .background(theme.color.background)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading) {
                                        Text("View statistics")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                        Text("Take a quick look at your progress")
                                            .font(.system(size: 14))
                                            .foregroundColor(theme.gray.foreground)
                                            .opacity(0.7)
                                    }
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 15))
                                        .opacity(0.5)
                                    
                                }.padding()
                                    .background(theme.gray.surface1)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        page = 2
                                    }
                            } else {
                                HStack(spacing: 10) {
                                    VStack {
                                        Image(systemName: "person.badge.plus")
                                            .foregroundColor(.white)
                                    }.frame(width: 50, height: 50)
                                        .background(theme.color.background)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading) {
                                        Text("Create an account")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                        Text("Gain access to all that Focust can offer")
                                            .font(.system(size: 14))
                                            .foregroundColor(theme.gray.foreground)
                                            .opacity(0.7)
                                    }
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 15))
                                        .opacity(0.5)
                                    
                                }.padding()
                                    .background(theme.gray.surface1)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        authenticated = false
                                    }
                                Spacer()
                            }
                        }
                    }.padding(.leading, 40)
                        .padding(.trailing, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomescreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomescreenView(theme: .constant(Theme()), page: .constant(1), startedSession: .constant(false), today: .constant("10"), token: .constant("094392432hh23r"), user: .constant(User(guest: false)), authenticated: .constant(true))
    }
}
