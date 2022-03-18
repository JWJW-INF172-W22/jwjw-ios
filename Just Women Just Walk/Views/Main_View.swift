//
//  Main_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct Main_View: View {
    @StateObject var viewRouter = ViewRouter()
    
    @StateObject var uiConstants = UIConstants()
    
    var body: some View {
        switch viewRouter.currentPage {
        case .logInOrSignUp:
            LoginOrSignup_View(viewRouter: viewRouter)
                .environmentObject(uiConstants)
        case .SignUp:
            SignUpPage_View()
                .environmentObject(uiConstants)
        case .HomeCharts:
            HomeCharts_View()
                .environmentObject(uiConstants)
        case .SplashScreen:
            SplashScreen_View(viewRouter: viewRouter)
                .environmentObject(uiConstants)
        }
    }
}

struct Main_View_Previews: PreviewProvider {
    static var previews: some View {
        Main_View(viewRouter: ViewRouter())
    }
}
