//
//  baseEmptyState.swift
//  SystemUI-Uber
//
//  Created by Caleb Hill on 3/20/23.
//

import SwiftUI

struct BaseEmptyState: View {
    let image: Image
    let title: String
    let subtitle: String
    let buttonText: String?
    let buttonAction: (() -> Void)?

    init(image: Image, title: String, subtitle: String, buttonText: String? = nil, buttonAction: (() -> Void)? = nil) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }

    var body: some View {
        VStack(spacing: 16) {
            image
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            if let buttonText = buttonText, let buttonAction = buttonAction {
                            BaseButton(label: buttonText, action: buttonAction, size: Size, type: buttonType, shape: Shape)
                        }
                    }
                   .padding()
                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(Color(.systemBackground))
                   .edgesIgnoringSafeArea(.all)
               }
           }
