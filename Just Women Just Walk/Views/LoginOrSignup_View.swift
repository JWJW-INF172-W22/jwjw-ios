//
//  LoginOrSignupView.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct LoginOrSignup_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var signUpPressed : Bool = false
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack {
                Spacer()
                JWJWCenterHeader_Component()
                Spacer()
                Button_Component(text: .constant("Login"), type: .constant(.solid))
                Button_Component(text: .constant("Sign Up"), type: .constant(.outline))
                Button_Component(text: .constant("Forgot Password?"), type: .constant(.text))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrSignup_View().environmentObject(UIConstants())
    }
    
}
