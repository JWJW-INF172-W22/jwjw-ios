//
//  OutlineButton_Style.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct OutlineButton_Style: ButtonStyle {
    var uiConstants : UIConstants = UIConstants()
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(uiConstants.fgTextColor)
            .padding([.all])
            .overlay(
                RoundedRectangle(cornerRadius: uiConstants.buttonCornerRadius)
                    .stroke(uiConstants.fgTextColor, lineWidth: uiConstants.buttonLineWidth)
                    .frame(width: uiConstants.buttonWidth, height: uiConstants.buttonHeight)
            )
    }
}
