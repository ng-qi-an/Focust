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
    @State var user:User = User(dictionary: ["name": "John Doe", "id": "12345678"])
    @State var authenticated = false
    @State var enabled = false
    @State var hasError = false
    let apiManager = APIManager()
    let users = UsersManager()
    
    var body: some View {
        VStack {
            if enabled {
                if authenticated {
                    MainController(authenticated: $authenticated, user: $user)
                } else {
                    AuthController(authenticated: $authenticated, token: $token)
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
                            AF.request(apiUrl("/users/verify?token=\(token)")).response { response in
                                let res = apiManager.status(response)
                                switch res.code {
                                case .Success:
                                    enabled = true
                                    authenticated = true
                                    user = User(dictionary: res.data["data"] as! [String : Any])
                                case .Forbidden:
                                    token = ""
                                    enabled = true
                                default:
                                    hasError = true
                                    
                                }
                            }
//                            let resultToken = try await users.retrieve(token: token)
//                            if resultToken["status"]! as! String == "OK"{
//                                enabled = true
//                                authenticated = true
//                                user = User(dictionary: resultToken["data"] as! [String : Any])
//                            } else {
//                                token = ""
//                                enabled = true
//                            }
                        } else {
                            enabled = true
                        }
                    default:
                        hasError = true
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
