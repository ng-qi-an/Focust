//
//  AuthStartingPage.swift
//  Focust
//
//  Created by Ethan Chow on 16/11/23.
//

import SwiftUI

struct AuthController: View {
    @Binding var authenticated: Bool;
    @Binding var token: String;
    @Binding var user: User;
    @Binding var verifyToken: Bool;
    
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 216/255, green: 255/255, blue:250/255)
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Image("startPageBg")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 456)
                }
                VStack(spacing: 20){
                    VStack(spacing: 5) {
                        Image("placeholderIcon")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .offset(y: -30)
                        Text("**Start you focus journey**")
                            .font(.system(size: 25))
                            .foregroundColor(Color(red: 102/255, green: 100/255, blue: 100/255))
                        Text("**TODAY!**")
                            .font(.system(size: 40))
                            .foregroundColor(Color(red: 45/255, green: 212/255, blue: 191/255))
                    }.offset(y: -125)
                    
                    NavigationLink(destination: SignupPassword(authenticated: $authenticated, token: $token, password: $password, username: $username, user: $user, verifyToken: $verifyToken)) {
                        HStack {
                            Text("Sign Up")
                            Spacer()
                            Image(systemName: "person.crop.circle.badge.plus")
                        }
                        .padding(Edge.Set(arrayLiteral: .leading, .trailing), 30)
                        .frame(width: 315, height: 50)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                    }.simultaneousGesture(TapGesture().onEnded{
                        Haptics.shared.play(.light)

                    })
                    NavigationLink(destination: LoginView(authenticated: $authenticated, token: $token, username: $username, password: $password, user: $user, verifyToken: $verifyToken)) {
                        HStack {
                            Text("Log In")
                            Spacer()
                            Image(systemName: "key")
                        }
                        .padding(Edge.Set(arrayLiteral: .leading, .trailing), 30)
                        .frame(width: 315, height: 50)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .shadow(color: Color(red: 218/255, green: 218/255, blue: 218/255), radius: 4, y: 3)
                    }.simultaneousGesture(TapGesture().onEnded{
                        Haptics.shared.play(.light)

                    })
                }
            }.ignoresSafeArea(.all)
        }
    }
}

struct AuthController_Previews: PreviewProvider {
    static var previews: some View {
        AuthController(authenticated: .constant(false), token: .constant(""), user: .constant(User()), verifyToken: .constant(false))
    }
}
