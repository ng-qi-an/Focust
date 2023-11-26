//
//  StatisticsDetailsView.swift
//  Focust
//
//  Created by Ng Qi An on 26/11/23.
//

import SwiftUI

struct StatisticsDetailsView: View {
    var data = Stat()
    init(data: Stat){
        self.data = data
    }
    var body: some View {
        Text("\(data.date)")
    }
}

#Preview {
    StatisticsDetailsView(data: Stat())
}
