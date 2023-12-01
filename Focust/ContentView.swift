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
    @AppStorage("darkMode") var darkMode = true
    @AppStorage("AppearanceMode") var mode: AppearanceMode = AppearanceMode.Light
    @AppStorage("AppearanceScheme") var color: AppearanceScheme = AppearanceScheme.Teal
    @State var theme = Theme()
    let apiManager = APIManager()
    
    var body: some View {
        VStack {
            if enabled {
                if authenticated {
                    MainController(authenticated: $authenticated, user: $user, today: $today, token: $token, verifyToken: $verifyToken, darkMode: $darkMode, mode: $mode, color: $color, theme: $theme)
                } else {
                    AuthController(authenticated: $authenticated, token: $token, user: $user, verifyToken: $verifyToken, theme: $theme)
                        .preferredColorScheme(mode == AppearanceMode.Dark ? .dark : .light)
                }
            } else {
                ProgressView()
            }
            
        }.ignoresSafeArea(.all)
            .preferredColorScheme(mode == AppearanceMode.Dark ? .dark : .light)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear() {
                if darkMode == true {
                    mode = AppearanceMode.Dark
                }
                theme = Theme(mode: mode, scheme: color)
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
                            verifyToken = false
                            enabled = true
                            authenticated = true
                            today = res.data["today"] as! String
                            user = User(dictionary: res.data["data"] as! [String : Any])
                        case .Forbidden:
                            token = ""
                            enabled = true
                            authenticated = false
                        default:
                            hasError = true
                            enabled = false
                            authenticated = false
                            
                        }
                        verifyToken = false
                    }
                }
            }
            .onChange(of: mode) { new in
                theme = Theme(mode: new, scheme: color)
            }
            .onChange(of: color) { new in
                theme = Theme(mode: mode, scheme: new)
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
