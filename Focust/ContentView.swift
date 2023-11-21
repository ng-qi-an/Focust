//
//  ContentView.swift
//  Focust
//
//  Created by Ng Qi An on 12/11/23.
//

import SwiftUI
import AlertToast

struct ContentView: View {
    @State var authenticated = false
    @State var enabled = false
    @State var hasError = false
    let apiManager = APIManager()
    
    var body: some View {
        VStack {
            if enabled {
                if authenticated {
                    MainController(authenticated: $authenticated)
                } else {
                    AuthController(authenticated: $authenticated)
                        .preferredColorScheme(.light)
                }
            } else {
                ProgressView()
            }
            
        }.ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .task {
                do {
                    let result = try await apiManager.isAlive()
                    if result["status"]! as! String == "OK"{
                        enabled = true
                    } else {
                        hasError = true
                    }
                } catch {
                    hasError = true
                    print(String(describing: error))
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
