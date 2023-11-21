//
//  Focus_PomoView.swift
//  Focust
//
//  Created by Ethan Chow on 21/11/23.
//

import SwiftUI

struct Focus_PomoView: View {
    
    @Binding var theme: Theme
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [theme.color.button, theme.color.background], startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("triangles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 380, height: 191)
                    Spacer()
                }
                VStack {
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Focus_PomoView_Previews: PreviewProvider {
    static var previews: some View {
        Focus_PomoView(theme: .constant(Theme()))
    }
}
