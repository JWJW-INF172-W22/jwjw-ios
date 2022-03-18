//
//  LoginOrSignupView.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct LoginOrSignup_View: View {
    @StateObject var viewRouter: ViewRouter
    
    @EnvironmentObject var uiConstants : UIConstants
        
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                uiConstants.gradientTopColor,
                uiConstants.gradientBottomColor
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                JWJWCenterHeader_Component()
                Spacer()
                Button_Component(text: .constant("Login"),
                                 type: .constant(.solid),
                                 action: .constant({
                                 }))
                Button("Sign Up", action: {
                    viewRouter.currentPage = .SignUp
                }).buttonStyle(OutlineButton_Style())
                Button_Component(text: .constant("Forgot Password?"), type: .constant(.text), action: .constant({}))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrSignup_View(viewRouter: ViewRouter())
            .environmentObject(UIConstants())
    }
    
}
