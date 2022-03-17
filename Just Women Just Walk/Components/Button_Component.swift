//
//  ButtonComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

enum ButtonType {
    case solid
    case outline
    case text
}

struct Button_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var text: String
    @Binding var type: ButtonType
    @Binding var action: () -> Void
    
    var body: some View {
        if(type == .solid) {
            Button(action: action,
                   label: {
                    Text(text)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: uiConstants.buttonCornerRadius)
                                .stroke(uiConstants.buttonbgColor, lineWidth: uiConstants.buttonLineWidth)
                                .background(uiConstants.buttonbgColor)
                                .cornerRadius(uiConstants.buttonCornerRadius)
                                .frame(width: uiConstants.buttonWidth, height: uiConstants.buttonHeight)
                        )
                   }
            )
        }
        else if (type == .outline) {
            Button(action: {},
                   label: {
                    Text(text)
                        .foregroundColor(uiConstants.fgTextColor)
                        .padding([.all])
                        .overlay(
                            RoundedRectangle(cornerRadius: uiConstants.buttonCornerRadius)
                                .stroke(uiConstants.fgTextColor, lineWidth: uiConstants.buttonLineWidth)
                                .frame(width: uiConstants.buttonWidth, height: uiConstants.buttonHeight)
                        )
                   }
            )
        }
        else if (type == .text) {
            Button(action: {},
                   label: {
                    Text(text)
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(uiConstants.fgTextColor)
                        .padding([.all])
                   }
            )
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        Button_Component(text: .constant("Button Text"),
                         type: .constant(.solid), action: .constant({})
        ).environmentObject(UIConstants())
    }
}
