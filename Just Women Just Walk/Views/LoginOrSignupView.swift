//
//  LoginOrSignupView.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct LoginOrSignupView: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack {
                Spacer()
                JWJWCenterHeaderComponent()
                Spacer()
                ButtonComponent(text: .constant("Login"), type: .constant(.solid))
                ButtonComponent(text: .constant("Sign Up"), type: .constant(.outline))
                ButtonComponent(text: .constant("Forgot Password?"), type: .constant(.text))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrSignupView().environmentObject(UIConstants())
    }
    
}
