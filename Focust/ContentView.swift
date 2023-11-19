//
//  ContentView.swift
//  Focust
//
//  Created by Ng Qi An on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var authenticated = false
    var body: some View {
        VStack {
            if authenticated {
                MainController(authenticated: $authenticated)
            } else {
                AuthController(authenticated: $authenticated)
                    .preferredColorScheme(.light)
            }
        }.ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
