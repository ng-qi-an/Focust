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
                VStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(theme.gray.background)
                        .frame(height: 30)
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
                            Rectangle()
                                .foregroundColor(theme.gray.background)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                        }
                        .background(theme.gray.background)
                        VStack(spacing: 20) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 390, height: 200)
                                    .foregroundColor(theme.gray.surface1)
                                    .cornerRadius(20)
                                VStack {
                                    HStack {
                                        Image(systemName: "clock")
                                        Text("HOURS FOCUSED")
                                            .font(.system(size: 15))
                                            .foregroundColor(theme.gray.foreground)
                                    }
                                    .padding(.trailing, 200)
                                    HStack {
                                        VStack {
                                            Text("**1**")
                                                .font(.system(size: 70))
                                                .foregroundColor(theme.gray.foreground)
                                            Text("Keep up the good work!")
                                                .font(.system(size: 20))
                                                .foregroundColor(theme.gray.surface4)
                                                .padding(.bottom, 10)
                                        }
                                        Image("clock")
                                            .resizable()
                                            .frame(width: 110, height: 110)
                                            .padding(.leading, 20)
                                    }
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .frame(width: 390, height: 200)
                                    .foregroundColor(theme.gray.surface1)
                                    .cornerRadius(20)
                                HStack {
                                    VStack {
                                        HStack {
                                            Image(systemName: "clock.arrow.circlepath")
                                                .padding(.leading, 40)
                                            Text("TOTAL TIME")
                                                .font(.system(size: 15))
                                                .foregroundColor(theme.gray.foreground)
                                            Spacer()
                                        }
                                        VStack {
                                            Text("90")
                                                .font(.system(size: 70))
                                                .foregroundColor(theme.gray.foreground)
                                                .padding(.top, 10)
                                            Text("mins")
                                                .font(.system(size: 20))
                                                .foregroundColor(theme.gray.surface4)
                                        }
                                        .padding(.leading, 20)
                                    }
                                    Rectangle()
                                        .frame(width: 2, height: 200)
                                        .padding(.leading, 10)
                                        .foregroundColor(theme.gray.surface4)
                                    VStack {
                                        HStack {
                                            Image(systemName: "wind")
                                            Text("BREAKS")
                                                .font(.system(size: 15))
                                                .foregroundColor(theme.gray.foreground)
                                        }
                                        .padding(.leading, 10)
                                        VStack {
                                            Text("0")
                                                .font(.system(size: 70))
                                                .foregroundColor(theme.gray.foreground)
                                                .padding(.top, 10)
                                            Text("mins")
                                                .font(.system(size: 20))
                                                .foregroundColor(theme.gray.surface4)
                                        }
                                        .padding(.leading, 40)
                                    }
                                    .padding(.trailing, 100)
                                }
                            }
                            HStack(spacing: 30) {
                                VStack {
                                    HStack {
                                        Image(systemName: "gearshape")
                                        Text("FOCUS MODE")
                                            .font(.system(size: 15))
                                            .foregroundColor(theme.gray.foreground)
                                    }
                                    VStack {
                                        Text("Flexible")
                                            .padding(.top, 40)
                                            .padding(.bottom, 60)
                                            .font(.system(size: 40))
                                            .foregroundColor(theme.gray.foreground)
                                    }
                                }
                                .frame(maxWidth: 180, maxHeight: 200)
                                .background(theme.gray.surface1)
                                VStack {
                                    HStack {
                                        Image(systemName: "message")
                                        Text("SUGGESTIONS")
                                            .font(.system(size: 15))
                                            .foregroundColor(theme.gray.foreground)
                                    }
                                    VStack {
                                        Image("feedback")
                                            .resizable()
                                            .frame(maxWidth: 70, maxHeight: 70)
                                            .padding(.top, 10)
                                        
                                    }
                                }
                                .frame(maxWidth: 180, maxHeight: 200)
                                .background(theme.gray.surface1)
                                
                            }
                        }
                    }
                    .navigationTitle("Statistics")
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(theme: .constant(Theme()))
    }
}
