//
//  Login.swift
//  Focust
//
//  Created by Ng Qi An on 16/11/23.
//

import SwiftUI
import AlertToast
import Alamofire

struct SignupView: View {
    let apiManager = APIManager()
    
    @State var loading: Bool = false
    @Binding var authenticated: Bool;
    @Binding var token: String;
    
    @Binding var verifyToken: Bool;
    @Binding var password: String;
    @Binding var username: String;
    @Binding var theme: Theme;
    @Binding var user: User;

    @State var confirmPassword: String = ""
    @State private var apiError = false
    @State private var apiErrorMessage = ""
    @State private var showTerms = false
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        VStack {
                            Image(systemName: "chevron.left")
                        }.padding()
                            .frame(width: 50, height: 50)
                            .background(theme.gray.surface1)
                            .cornerRadius(50)
                            .foregroundColor(theme.gray.foreground)
                    }
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign In")
                    }.variant(.outline, theme: theme, stroke: theme.color.foreground)
                }
                Text("Create an Account")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.top, 20)
                Text("Jump start your focus for academic excellence.")
                    .foregroundColor(theme.gray.foreground)
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                VStack (spacing: 15){
                    Input(type: .Text, theme: theme, label: "Username", value: $username)
                    Input(type: .Password, theme: theme, label: "Password", value: $password)
                    Input(type: .Password, theme: theme, label: "Confirm password", value: $confirmPassword)
                    Text("By creating an account, you agree to our Terms of Service and our Privacy Policy. **Click to learn more**.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(theme.gray.foreground)
                        .opacity(0.5)
                        .onTapGesture {
                            showTerms = true
                        }
                }.sheet(isPresented: $showTerms){
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            VStack {
                                Image("LightIcon")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                Text("Terms of Service")
                                    .font(.system(size: 35))
                                    .fontWeight(.bold)
                                    .padding(.top, 20)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                Text("Last updated, 1 Dec 2023")                                .frame(maxWidth: .infinity)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                            }.padding()
                                .frame(height: 300)
                                .background(theme.color.background)
                            
                            VStack {
                                Text("Introduction")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                Text("Please read these terms carefully before using Focust (referred to as \"the app\"). By using the app, you agree to comply with and be bound by these terms. If you disagree with any part of the terms, please do not use the app.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("User Conduct")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)

                                Text("You may create, stop, view, and delete your own sessions.\nYou are not permitted to access other users' sessions without prior permission or exploit the app for data.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Account Security")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)

                                Text("You are responsible for safeguarding your password. If lost, there is currently no way to retrieve your password. Do not share your password. Compromised accounts may be terminated to prevent misuse.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Data Security")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                Text("Your data is securely stored on servers hosted by reputable companies and is encrypted. Special authentication codes are provided for login and can be revoked for security purposes.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Intellectual Property")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                Text("Content created within the app can be used within the app or on related services. \nCommercial use requires prior permission from the app.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Uptime and Maintenance")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                Text("We strive for consistent app uptime. However, expect occasional downtimes and maintenance. Announcements will be made within the app.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Modifications to Terms")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                Text("The app reserves the right to modify these terms. Users will be notified of any changes.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Termination")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)

                                Text("Violation of these terms may result in termination of user access to the app.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            VStack {
                                Text("Disclaimer of Warranties and Limitation of Liability")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)

                                Text("The app provides services \"as is\" without warranties. The app shall not be held liable for direct or indirect damages arising from its use.")
                                    .multilineTextAlignment(.center)
                            }.padding()
                            Spacer()
                        }
                    }
                }
                Spacer()
                Button {
                    if loading {
                        // do nothing
                    } else if username.isEmpty {
                        apiError = true
                        apiErrorMessage = "Username is required"
                        Haptics.shared.notify(.error)
                        
                    } else if username.count < 3 {
                        apiError = true
                        apiErrorMessage = "Username must be more than 3 characters"
                        Haptics.shared.notify(.error)
                        
                    } else if username.count > 32 {
                        apiError = true
                        apiErrorMessage = "Username must be less than 32 characters"
                        Haptics.shared.notify(.error)
                        
                    } else if username.rangeOfCharacter(from: disallowedCharacters.inverted) != nil {
                        apiError = true
                        apiErrorMessage = "Only A-Z, 0-9, periods, _, or - are allowed in usernames"
                        Haptics.shared.notify(.error)
                    } else if password.isEmpty {
                        apiError = true
                        apiErrorMessage = "Password is required"
                        Haptics.shared.notify(.error)
                    } else if password.count < 8 {
                        apiError = true
                        apiErrorMessage = "Password must be more than 8 characters"
                        Haptics.shared.notify(.error)
                    } else if password != confirmPassword {
                        apiError = true
                        apiErrorMessage = "Passwords do not match"
                        Haptics.shared.notify(.error)
                    } else {
                        loading = true
                        apiError = false
                        AF.upload(multipartFormData: { multiFormData in
                            multiFormData.append(Data(username.utf8), withName: "username")
                            multiFormData.append(Data(password.utf8), withName: "password")
                        }, to: apiUrl("/users/register")).response { response in
                            let res = apiManager.status(response)
                            switch res.code {
                            case .Success:
                                Haptics.shared.notify(.success)
                                let data = res.data["data"] as! [String: Any]
                                token = data["token"] as! String
                                user = User(dictionary: data)
                                authenticated = true
                            case .Forbidden:
                                loading = false
                                apiErrorMessage = "An account with that username already exists"
                                apiError = true
                                Haptics.shared.notify(.error)
                            default:
                                loading = false
                                apiErrorMessage = "An unknown error occured"
                                apiError = true
                                Haptics.shared.notify(.error)
                            }
                        }
                    }
                } label: {
                    if loading {
                        HStack {
                            ProgressView()
                        }.frame(maxWidth: .infinity)
                        
                    } else {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 20))
                    }
                }.variant(.fill, theme: theme, background: theme.color.background)
            }.padding(.leading, 40)
            .padding(.trailing, 40)
            .toast(isPresenting: $apiError){
                AlertToast(displayMode: .hud, type: .error(Color.red), title: "Request Failed", subTitle: apiErrorMessage)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(authenticated: .constant(false), token: .constant(""), verifyToken: .constant(false), password: .constant("12345678"), username: .constant("12345678"), theme: .constant(Theme()), user: .constant(User()))
    }
}
