//
//  ContentView.swift
//  SystemUI-Pinterest
//
//  Created by Caleb Hill on 3/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "Button label"
    @State private var buttonType: ButtonType = .red
    @State private var fillWidth = false
    @State private var isLargeSize: Bool = false
    
    var body: some View {
            VStack() {
                VStack() {
                    Spacer()
                    gestaltButton(buttonText: buttonText.isEmpty ? "Button label" : buttonText, buttonType: buttonType, fillWidth: fillWidth, buttonSize: isLargeSize ? .lg : .sm)
                        .padding()
                    Spacer()
                }
                
                Form {
                    Section(header: Text("Button label")) {
                        TextField("Button label", text: $buttonText)
                    }
                    
                    Section(header: Text("Button type")) {
                        Picker("Button type", selection: $buttonType) {
                            Text("Primary").tag(ButtonType.red)
                            Text("Primary-blue").tag(ButtonType.blue)
                            Text("Secondary").tag(ButtonType.gray)
                            Text("Tertiary").tag(ButtonType.transparent)
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Section(header: Text("Button size")) {
                        Toggle("is Large", isOn: $isLargeSize)
                    }
                    
                    Section {
                        Toggle("Fill width", isOn: $fillWidth)
                    }
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
