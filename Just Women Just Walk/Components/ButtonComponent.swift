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

struct ButtonComponent: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var text: String
    @Binding var type: ButtonType
    
    var body: some View {
        if(type == .solid) {
            Button(action: {},
                   label: {
                    Text(text)
                        .foregroundColor(.white)
                        .padding([.all])
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(uiConstants.buttonbgColor, lineWidth: 1)
                                .background(uiConstants.buttonbgColor)
                                .cornerRadius(10)
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
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(uiConstants.fgTextColor, lineWidth: 1)
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
        ButtonComponent(text: .constant("Button Text"),
                        type: .constant(.solid)
        ).environmentObject(UIConstants())
    }
}
