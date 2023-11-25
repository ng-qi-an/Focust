//
//  ContentView.swift
//  Focust
//
//  Created by Ng Qi An on 12/11/23.
//

import SwiftUI
import AlertToast
import Alamofire

struct ContentView: View {
    @AppStorage("token") var token: String = ""
    @State var today: String = "0"
    @State var user:User = User()
    @State var authenticated = false
    @State var enabled = false
    @State var hasError = false
    @State var verifyToken = false
    let apiManager = APIManager()
    let users = UsersManager()
    
    var body: some View {
        VStack {
            if enabled {
                if authenticated {
                    MainController(authenticated: $authenticated, user: $user, today: $today, token: $token)
                } else {
                    AuthController(authenticated: $authenticated, token: $token, verifyToken: $verifyToken)
                        .preferredColorScheme(.light)
                }
            } else {
                ProgressView()
            }
            
        }.ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear() {
                AF.request(apiUrl("/"), encoding: JSONEncoding.default).response { response in
                    switch apiManager.status(response).code {
                    case .Success:
                        if token != "" {
                            verifyToken = true
                        } else {
                            enabled = true
                        }
                    default:
                        hasError = true
                    }
                }
            }
            .onChange(of: verifyToken){ newValue in
                if newValue == true {
                    AF.request(apiUrl("/users/verify?token=\(token)")).response { response in
                        let res = apiManager.status(response)
                        switch res.code {
                        case .Success:
                            enabled = true
                            authenticated = true
                            today = res.data["today"] as! String
                            user = User(dictionary: res.data["data"] as! [String : Any])
                        case .Forbidden:
                            token = ""
                            enabled = true
                        default:
                            hasError = true
                            
                        }
                    }
                }
            }
            .toast(isPresenting: $hasError){
                AlertToast(type: .error(.red), title: "Unable to connect")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
