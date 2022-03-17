//
//  UIConstants.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

class UIConstants : ObservableObject {    
    @Published var bgColor = Color(
        red: 224 / 255,
        green: 246 / 255,
        blue: 235 / 255
    )
    
    @Published var buttonbgColor = Color(
        red: 89 / 255,
        green: 128 / 255,
        blue: 97 / 255
    )
    
    @Published var selectedButtonbgColor = Color(
        red: 248 / 255,
        green: 109 / 255,
        blue: 112 / 255
    )
    
    @Published var fgTextColor = Color(
        red: 20 / 255,
        green: 51 / 255,
        blue: 46 / 255
    )
    
    @Published var dropDownbgColor = Color(
        red: 237 / 255,
        green: 244 / 255,
        blue: 255 / 255
    )
    
    @Published var tileRedUnselectedColor = Color(
        red: 253 / 255,
        green: 233 / 255,
        blue: 234 / 255
    )
    
    @Published var tileRedSelectedColor = Color(
        red: 250 / 255,
        green: 200 / 255,
        blue: 193 / 255
    )
    
    @Published var tileRedSelectedStrokeColor = Color(
        red: 248 / 255,
        green: 109 / 255,
        blue: 112 / 255
    )
    
    @Published var tileBlueUnselectedColor = Color(
        red: 237 / 255,
        green: 244 / 255,
        blue: 255 / 255
    )
    
    @Published var tileBlueSelectedColor = Color(
        red: 177 / 255,
        green: 208 / 255,
        blue: 255 / 255
    )
    
    @Published var tileBlueSelectedStrokeColor = Color(
        red: 0 / 255,
        green: 83 / 255,
        blue: 209 / 255
    )
    
    @Published var graphFgColor = Color(
        red: 248 / 255,
        green: 109 / 255,
        blue: 112 / 255
    )
    
    @Published var miniGraphFgColor = Color(
        red: 89 / 255,
        green: 128 / 255,
        blue: 97 / 255
    )
    
    @Published var messageBgColorA = Color(
        red: 177 / 255,
        green: 208 / 255,
        blue: 255 / 255
    )
    
    @Published var buttonCornerRadius : CGFloat = 10
    @Published var buttonLineWidth : CGFloat = 1
    @Published var buttonHeight : CGFloat = 50
    @Published var buttonWidth : CGFloat = 200
    @Published var dropDownHeight : CGFloat = 50
    @Published var dropDownWidth : CGFloat = 400
    @Published var rgCornerRadius : CGFloat = 50
    @Published var rgVerticalPadding : CGFloat = 7.5
    
    @Published var dividerLineWidth : CGFloat = 1
    
    @Published var headerText = "Just Women \n Just Walk"
    @Published var headerShortText = "JWJW"
}
