//
//  AccountDetailsView.swift
//  Focust
//
//  Created by Ng Qi An on 22/11/23.
//

import SwiftUI

struct AccountDetailsView: View {
    @Binding var user: User;
    var body: some View {
        NavigationView {
            List {
                Section {
                    
                }
            }
        }.navigationTitle("Account Settings")
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView(user: .constant(User()))    }
}
