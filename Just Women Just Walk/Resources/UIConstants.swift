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
        green: 232 / 255,
        blue: 215 / 255
    )
    
    @Published var buttonbgColor = Color(
        red: 89 / 255,
        green: 128 / 255,
        blue: 97 / 255
    )
    
    @Published var fgTextColor = Color(
        red: 20 / 255,
        green: 51 / 255,
        blue: 46 / 255
    )
    
    @Published var buttonCornerRadius : CGFloat = 10
    @Published var buttonLineWidth : CGFloat = 1
    @Published var buttonHeight : CGFloat = 50
    @Published var buttonWidth : CGFloat = 200
    
    @Published var dividerLineWidth : CGFloat = 1
    
    @Published var headerText = "Just Women \n Just Walk"
    @Published var headerShortText = "JWJW"
}
