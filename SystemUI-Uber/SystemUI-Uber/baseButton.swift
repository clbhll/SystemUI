//
//  baseButton.swift
//  SystemUI-Uber
//
//  Created by Caleb Hill on 3/20/23.
//

import SwiftUI

enum Size {
    case small, medium, large
}

enum buttonType {
    case primary, secondary, tertiary
}

enum Shape {
    case square, rectangle, pill
}

struct BaseButton: View {
    let label: String
    let action: () -> Void
    let size: Size
    let type: buttonType
    let shape: Shape

    init(label: String, action: @escaping () -> Void, size: Size = .medium, type: buttonType = .primary, shape: Shape = .rectangle) {
        self.label = label
        self.action = action
        self.size = size
        self.type = type
        self.shape = shape
    }

    private var buttonColors: (background: Color, foreground: Color) {
        switch type {
        case .primary:
            return (Color.blue, Color.white)
        case .secondary:
            return (Color.white, Color.blue)
        case .tertiary:
            return (Color.clear, Color.blue)
        }
    }

    private var buttonPadding: (horizontal: CGFloat, vertical: CGFloat) {
        switch size {
        case .small:
            return (12, 6)
        case .medium:
            return (24, 12)
        case .large:
            return (32, 16)
        }
    }

    private var buttonCornerRadius: CGFloat {
        switch shape {
        case .square:
            return 0
        case .rectangle:
            return 8
        case .pill:
            return 25
        }
    }

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.headline)
                .foregroundColor(buttonColors.foreground)
                .padding(.horizontal, buttonPadding.horizontal)
                .padding(.vertical, buttonPadding.vertical)
                .background(type == .tertiary ? Color.clear : buttonColors.background)
                .cornerRadius(buttonCornerRadius)
        }
        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius)
                .stroke(type == .tertiary ? buttonColors.foreground : Color.clear, lineWidth: 1)
        )
        .buttonStyle(PlainButtonStyle())
    }
}
