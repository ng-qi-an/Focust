//
//  Statistics.swift
//  Focust
//
//  Created by Ethan Chow on 14/11/23.
//

import SwiftUI

struct StatisticsView: View {
    @Binding var theme: Theme;
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        Text("Recent days")
                            .opacity(0.5)
                            .font(.system(size: 20))
                            .offset(x: -120, y: 30)
                        Image("vector")
                        HStack {
                            Spacer()
                            Text("Mon")
                                .opacity(0.5)
                                .font(.system(size: 13))
                                .padding(.trailing, 30)
                            Spacer()
                            Text("Tue")
                                .opacity(0.5)
                                .font(.system(size: 13))
                                .padding(.trailing, 30)
                            Spacer()
                            Text("Wed")
                                .opacity(0.5)
                                .font(.system(size: 13))
                                .padding(.trailing, 30)
                            Spacer()
                            Text("Thu")
                                .opacity(0.5)
                                .font(.system(size: 13))
                                .padding(.trailing, 30)
                            Spacer()
                            Text("Today")
                                .font(.system(size: 13))
                            Spacer()
                        }
                        
                    }
                    .ignoresSafeArea(edges: .bottom)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .background(theme.gray.background)
                    VStack {
                        Rectangle()
                            .opacity(0)
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        VStack {
                            Text("**1**")
                                .font(.system(size: 70))
                                .foregroundColor(.white)
                            Text("hours clocked")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                        }.offset(y: -15)
                        HStack {
                            Image(systemName: "clock.arrow.circlepath")
                                .foregroundColor(theme.gray.foreground)
                                .padding(.leading, 20)
                            Text("Total time: 1hr 20 mins")
                                .foregroundColor(theme.gray.foreground)
                            Spacer()
                        }
                        .frame(width: 315, height: 40)
                        .background(theme.gray.background)
                        .cornerRadius(15)
                        HStack {
                            Image(systemName: "wind")
                                .padding(.leading, 20)
                                .foregroundColor(theme.gray.foreground)
                            Text("Breaks: 0")
                                .foregroundColor(theme.gray.foreground)
                            Spacer()
                        }
                        .frame(width: 315, height: 40)
                        .background(theme.gray.background)
                        .cornerRadius(15)
                        HStack {
                            Image(systemName: "gearshape")
                                .foregroundColor(theme.gray.foreground)
                                .padding(.leading, 20)
                            Text("Focus mode: Flexible")
                                .foregroundColor(theme.gray.foreground)
                            Spacer()
                        }
                        .frame(width: 315, height: 40)
                        .background(theme.gray.background)
                        .cornerRadius(15)
                        HStack {
                            Text("Suggestions")
                                .foregroundColor(theme.gray.foreground)
                                .padding(.leading, 20)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(theme.gray.foreground)
                                .padding(.trailing, 20)
                        }
                        .frame(width: 315, height: 50)
                        .background(theme.gray.background)
                        .cornerRadius(15)
                        Rectangle()
                            .opacity(0)
                            .frame(maxWidth: .infinity, maxHeight: 15)
                        HStack {
                            Text("Made a mistake? Remove it!")
                                .padding(.leading, 20)
                                .foregroundColor(theme.red.foreground)
                            Spacer()
                            Image(systemName: "trash")
                                .padding(.trailing, 20)
                                .foregroundColor(theme.red.foreground)
                        }
                        .frame(width: 315, height: 50)
                        .background(theme.gray.background)
                        .cornerRadius(15)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .background(theme.color.background)
                }
            }
                .navigationTitle("Statistics")
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(theme: .constant(Theme()))
    }
}
