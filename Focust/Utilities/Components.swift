//
//  Components.swift
//  Focust
//
//  Created by Ng Qi An on 30/11/23.
//

import SwiftUI

// Buttons

struct ButtonFillStyle: ButtonStyle {
    var theme: Theme = Theme()
    var background: Color = Theme().teal.background
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding()
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(background)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

struct ButtonOutlineStyle: ButtonStyle {
    var theme: Theme = Theme()
    var stroke: Color =  Theme().gray.surface4
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding()
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .foregroundColor(theme.gray.foreground)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 10)
                    .stroke(stroke, lineWidth: 1)
                    .opacity(configuration.isPressed ? 0.7 : 1)
                    .scaleEffect(configuration.isPressed ? 0.9 : 1)
            )
    }
}

enum ButtonVariants {
    case fill, outline
}

extension Button {

    @ViewBuilder
    func variant(_ style: ButtonVariants, theme: Theme, background: Color = Theme().gray.surface1, stroke: Color = Theme().gray.surface4) -> some View {
        switch style {
        case .fill:
            self.buttonStyle(ButtonFillStyle(theme: theme, background: background))
        case .outline:
            self.buttonStyle(ButtonOutlineStyle(theme: theme, stroke: stroke))
        }
    }
}

extension NavigationLink {

    @ViewBuilder
    func variant(_ style: ButtonVariants, theme: Theme, background: Color = Theme().gray.surface1, stroke: Color = Theme().gray.surface4) -> some View {
        switch style {
        case .fill:
            self.buttonStyle(ButtonFillStyle(theme: theme, background: background))
        case .outline:
            self.buttonStyle(ButtonOutlineStyle(theme: theme, stroke: stroke))
        }
    }
}

// Inputs

enum Fields {
    case Text, Password, Select, Number
}

struct InputType: View {
    var type: Fields = .Text
    var label: String = "Enter value here"
    @Binding var value: String
    var body: some View {
        switch type {
        case .Text:
            TextField(label, text: $value)
        case .Password:
            SecureField(label, text: $value)
        case .Number:
            TextField(label, text: $value)
                .keyboardType(.numberPad)
        default:
            TextField(label, text: $value)
        }
    }
}

struct Input: View {
    var type: Fields = .Text
    var theme: Theme = Theme()
    var label: String = "Enter value here"
    @Binding var value: String
    var options: Array<String> = []
    var values: Array<String> = []
    @FocusState private var focused:Bool
    @State private var isFocused: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if type != .Select {
                InputType(type: type, label: label, value: $value)
                    .focused($focused)
                    .font(.system(size: 20))
            } else {
                Select(theme: theme, label: label, options: options, values: values, value: $value, isFocused: $isFocused)
            }
        }
        .padding()
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .foregroundColor(theme.gray.foreground)
        .cornerRadius(10)
        .frame(maxWidth: .infinity, minHeight: 70)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(isFocused ? theme.color.foreground : theme.gray.surface4, lineWidth: 1)
                .frame(maxWidth: .infinity, minHeight: 70)

        )
        .onTapGesture {
            focused = true
        }
        .onChange(of: focused){ new in
            isFocused = new
        }
    }
}

struct Select: View {
    var theme: Theme
    var label: String
    var options: Array<String> = []
    var values: Array<String> = []
    @Binding var value: String
    @Binding var isFocused: Bool
    
    var body: some View {
        if #available(iOS 16.0, *) {
            SelectButton(theme: theme, label: label, value: $value, isFocused: $isFocused)
                .sheet(isPresented: $isFocused){
                    SelectMenu(theme: theme, label: label, options: options, values: values, value: $value, isFocused: $isFocused)
                        .presentationDetents([.height(200), .medium])
                }
        } else {
            SelectButton(theme: theme, label: label, value: $value, isFocused: $isFocused)
            sheet(isPresented: $isFocused){
                SelectMenu(theme: theme, label: label, options: options, values: values, value: $value, isFocused: $isFocused)
            }
        }
    }
}

struct SelectMenu: View {
    var theme: Theme
    var label: String
    var options: Array<String>
    var values: Array<String>
    @Binding var value: String
    @Binding var isFocused: Bool
    var body: some View {
            VStack {
                HStack {
                    Text(label)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Button {
                        isFocused = false
                    } label: {
                        Image(systemName: "multiply")
                    }
                }
                ScrollView {
                    if options.count > 0 {
                        ForEach(Array(options.enumerated()), id: \.offset) { index, element in
                            Button {
                                value = values[index]
                                isFocused = false
                            } label: {
                                Text(element)
                                    .frame(maxWidth: .infinity)
                            }.variant(value == values[index] ? .fill : .outline, theme: theme, background: theme.color.background, stroke: theme.gray.surface4)
                            
                        }
                    } else {
                        Text("No options defined for this menu.")
                    }
                }
                Spacer()
            }.padding(.top, 30)
            .padding(.leading, 40)
            .padding(.trailing, 40)
    }
}

struct SelectButton: View {
    var theme: Theme
    var label: String
    @Binding var value: String
    @Binding var isFocused: Bool
    
    
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(label)
                        .font(.system(size: 14))
                        .foregroundColor(theme.gray.foreground)
                        .multilineTextAlignment(.leading)
                        .opacity(0.5)
                    Text(value == "" ? "Choose an option" : value)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                Image(systemName: "chevron.down")
            }
            .onTapGesture {
                isFocused = true
            }
            .frame(maxWidth: .infinity)
        }
    }
}


struct Components: View {
    let theme = Theme(scheme: .Blue)
    @State var value = ""
    var body: some View {
        Button("Hello!"){
        }.variant(.fill, theme: theme)
        Button("Hello!"){
        }.variant(.outline, theme: theme)
        Input(type: .Select, value: $value, options: ["test", "lol"], values: ["test", "lol"])
        Input(type: .Text, value: $value)

    }
}

#Preview {
    Components()
}
