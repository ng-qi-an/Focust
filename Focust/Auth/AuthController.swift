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
    @Binding var theme: Theme;

    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    Image("IconArray")
                        .resizable()
                        .frame(width: 240, height: 240)
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .background(theme.color.background)
                Spacer()
                VStack(alignment: .leading) {
                    Text("**Focust** is")
                    Text("Your way towards")
                        .font(.system(size: 35))
                        .fontWeight(.light)
                    Text("academic success")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                    Text("today.")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                    Text("Keep track of goals, with a distraction-free environment. Change starts with you.")
                        .foregroundColor(theme.gray.foreground)
                        .opacity(0.7)
                        .padding(.top, -5)
                }.padding(.leading, 30)
                Spacer()
                HStack {
                    NavigationLink {
                        LoginView(authenticated: $authenticated, token: $token, verifyToken: $verifyToken, password: $password, username: $username, theme: $theme, user: $user)
                    } label: {
                        Text("Sign In")
                            .frame(maxWidth: .infinity)
                    }
                    .variant(.outline, theme: theme, stroke: theme.color.foreground)
                    NavigationLink {
                        SignupView(authenticated: $authenticated, token: $token, verifyToken: $verifyToken, password: $password, username: $username, theme: $theme, user: $user)
                    } label: {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                    }
                    .variant(.fill, theme: theme, background: theme.color.background)
                    
                }.padding(.leading, 40)
                    .padding(.trailing, 40)
                Button {
                    user = User(guest: true)
                    authenticated = true
                } label: {
                    Text("Try without an account")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(theme.gray.foreground)
                        .opacity(0.7)
                        .padding(.top, 10)
                }
                
            }.frame(maxWidth: .infinity)
        }
    }
}

struct AuthController_Previews: PreviewProvider {
    static var previews: some View {
        AuthController(authenticated: .constant(false), token: .constant(""), user: .constant(User()), verifyToken: .constant(false), theme: .constant(Theme()))
    }
}
