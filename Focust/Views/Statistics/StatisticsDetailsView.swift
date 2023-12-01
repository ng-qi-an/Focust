//
//  StatisticsDetailsView.swift
//  Focust
//
//  Created by Ng Qi An on 26/11/23.
//

import SwiftUI

struct StatisticsDetailsView: View {
    var data = Stat()
    var theme = Theme()
    init(data: Stat, theme: Theme){
        self.data = data
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    Text("**\((Int(data.sessionLength)! - Int(data.breakLength)!) / (60 * 60))**")
                        .font(.system(size: 70))
                    Text("hours clocked")
                    Spacer()
                }.frame(height: 200)
                VStack {
                    HStack {
                        Image(systemName: "clock")
                        Text("Total Time")
                            .textCase(.uppercase)
                        Spacer()
                    }.padding(.leading, 10)
                    .padding(.trailing, 10)
                    Spacer()
                    HStack {
                        Text("**\(Int(data.sessionLength)! / 60) mins**")
                            .font(.system(size: 40))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(theme.gray.surface1)
                .cornerRadius(20)
                HStack {
                    VStack {
                        HStack {
                            Image(systemName: "clock.arrow.2.circlepath")
                            Text("Mode")
                                .textCase(.uppercase)
                            Spacer()
                        }.padding(.leading, 10)
                            .padding(.trailing, 10)
                        Spacer()
                        HStack {
                            Text("**Flexible**")
                                .font(.system(size: 30))
                        }
                        Spacer()
                    }
                    VStack {
                        
                    }.frame(minWidth: 1, maxHeight: .infinity)
                        .background(theme.gray.surface4)
                    VStack {
                        HStack {
                            Image(systemName: "wind")
                            Text("Breaks")
                                .textCase(.uppercase)
                            Spacer()
                        }.padding(.leading, 10)
                            .padding(.trailing, 10)
                        Spacer()
                        HStack {
                            Text("**\(data.breaks)**")
                                .font(.system(size: 40))
                        }
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(theme.gray.surface1)
                .cornerRadius(20)
                VStack {
                    HStack {
                        Image(systemName: "leaf")
                        Text("Total Break Time")
                            .textCase(.uppercase)
                        Spacer()
                    }.padding(.leading, 10)
                    .padding(.trailing, 10)
                    Spacer()
                    HStack {
                        Text("**\(Int(data.breakLength)! / 60) mins**")
                            .font(.system(size: 40))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(theme.gray.surface1)
                .cornerRadius(20)
//                VStack {
//                    HStack {
//                        Image(systemName: "exclamationmark.triangle")
//                        Text("Danger")
//                            .textCase(.uppercase)
//                        Spacer()
//                    }.padding(.leading, 10)
//                    .padding(.trailing, 10)
//                    Spacer()
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("Made a mistake?")
//                                .font(.system(size: 25))
//                            Text("Perhaps it was an accident.")
//                        }
//                        Spacer()
//                        Button {
//                            
//                        } label: {
//                            HStack {
//                                Image(systemName: "trash")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 25))
//                            }.padding(25)
//                                .background(theme.red.background)
//                                .cornerRadius(40)
//                        }
//                    }
//                    Spacer()
//                }
//                .frame(maxWidth: .infinity, minHeight: 150)
//                .padding()
//                .background(theme.gray.surface1)
//                .cornerRadius(20)
                
            }
                .padding()
                .navigationTitle("\(data.date)")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    StatisticsDetailsView(data: Stat(), theme: Theme())
}
