//
//  Login.swift
//  Focust
//
//  Created by Ng Qi An on 16/11/23.
//

import SwiftUI
import AlertToast
import Alamofire

struct LoginView: View {
    let apiManager = APIManager()
    
    @State var loading: Bool = false
    @Binding var authenticated: Bool;
    @Binding var token: String;
    
    @Binding var verifyToken: Bool;
    @Binding var password: String;
    @Binding var username: String;
    @Binding var theme: Theme;
    @Binding var user: User;

    @State private var apiError = false
    @State private var apiErrorMessage = ""
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
                        Text("Sign Up")
                    }.variant(.outline, theme: theme, stroke: theme.color.foreground)
                }
                Text("Welcome Back")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding(.top, 20)
                Text("Return to your wonderful focus journey")
                    .foregroundColor(theme.gray.foreground)
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                VStack (spacing: 15){
                    Input(type: .Text, theme: theme, label: "Username", value: $username)
                    Input(type: .Password, theme: theme, label: "Password", value: $password)
                }
                Spacer()
                Button {
                    if loading {
                        // do nothing
                    } else if username.isEmpty {
                        apiError = true
                        apiErrorMessage = "Username is required"
                        Haptics.shared.notify(.error)
                        
                    } else if password.isEmpty {
                        apiError = true
                        apiErrorMessage = "Password is required"
                        Haptics.shared.notify(.error)
                    } else {
                        loading = true
                        apiError = false
                        AF.upload(multipartFormData: { multiFormData in
                                                                multiFormData.append(Data(username.utf8), withName: "username")
                                                                multiFormData.append(Data(password.utf8), withName: "password")
                        }, to: apiUrl("/users/login")).response { response in
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
                                apiErrorMessage = "No account exists with those credentials"
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
                        Text("Confirm")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authenticated: .constant(false), token: .constant(""), verifyToken: .constant(false), password: .constant("12345678"), username: .constant("12345678"), theme: .constant(Theme()), user: .constant(User()))
    }
}
