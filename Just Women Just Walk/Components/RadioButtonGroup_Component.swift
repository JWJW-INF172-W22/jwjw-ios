//
//  RadioButtonGroup_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/2/22.
//

import SwiftUI

struct RadioButtonGroup_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var labelText : String
    @Binding var buttonText : [[String]]
    @Binding var selectedText : String
    
    var body: some View {
        VStack {
            HStack {
                Text(labelText)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            ForEach(buttonText, id: \.self) { row in
                HStack {
                    ForEach (row, id: \.self) { text in
                        Button(text, action: {
                            self.selectedText = text
                        })
                            .foregroundColor(.white)
                            .padding(.vertical, uiConstants.rgVerticalPadding)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: uiConstants.rgCornerRadius)
                                    .stroke(uiConstants.buttonbgColor, lineWidth: uiConstants.buttonLineWidth)
                                    .background((self.selectedText == text) ? uiConstants.selectedButtonbgColor : uiConstants.buttonbgColor)
                                    .cornerRadius(uiConstants.rgCornerRadius)
                            )
                    }
                    Spacer()
                }
            }
        }.padding()
    }
}

struct RadioButtonGroup_Component_Previews: PreviewProvider {
    @State static var sel = ""
    static var previews: some View {
        RadioButtonGroup_Component(
            labelText: .constant("Test Button Group"),
            buttonText: .constant([["hello", "test"], ["wow"]]),
            selectedText: $sel
        )
            .environmentObject(UIConstants())
    }
}
