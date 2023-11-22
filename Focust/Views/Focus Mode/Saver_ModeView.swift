//
//  Saver_ModeView.swift
//  Focust
//
//  Created by Ethan Chow on 22/11/23.
//

import SwiftUI

struct Saver_ModeView: View {
    
    @Binding var theme: Theme
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Saver_ModeView_Previews: PreviewProvider {
    static var previews: some View {
        Saver_ModeView(theme: .constant(Theme()))
    }
}


