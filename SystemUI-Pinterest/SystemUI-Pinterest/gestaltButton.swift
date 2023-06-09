//
//  gestaltButton.swift
//  SystemUI-Pinterest
//
//  Created by Caleb Hill on 3/19/23.
//


enum ButtonType {
    case red, blue, gray, transparent
}

enum ButtonSize {
    case sm, lg

    var height: CGFloat {
        switch self {
        case .sm: return 48.0
        case .lg: return 60.0
        }
    }
}

import SwiftUI
import UIKit

struct gestaltButton: View {
    var foregroundColor: Color {
        switch buttonType {
        case .transparent:
            return Color.black
        case .gray:
            return Color.black
        default:
            return Color.white
        }
    }
    var buttonText: String
    var buttonType: ButtonType = .red
    var fillWidth: Bool = false
    var buttonSize: ButtonSize = .sm
    var backgroundColor: Color {
        switch buttonType {
            case .red:
                return Color(UIColor(red: 0.827, green: 0.176, blue: 0.184, alpha: 1))
            case .blue:
                return Color(UIColor(red: 0.188, green: 0.447, blue: 0.878, alpha: 1))
            case .gray:
                return Color(UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1))
            case .transparent:
                return Color(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0))
       
        }
    }
    
    struct ScaleButtonStyle: ButtonStyle {
           func makeBody(configuration: Self.Configuration) -> some View {
               configuration.label
                   .scaleEffect(configuration.isPressed ? 0.97 : 1)
                   .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
           }
       }
    
    @State private var isPressed: Bool = false
    
    var body: some View {
            Button(action: {}) {
                Text(buttonText)
                    .foregroundColor(foregroundColor)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(16)
                    .frame(maxWidth: fillWidth ? .infinity : nil, minHeight: buttonSize.height)
                    .background(backgroundColor)
                    .cornerRadius(666)
            }
            .buttonStyle(ScaleButtonStyle())
           }
       }


