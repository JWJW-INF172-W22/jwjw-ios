//
//  ViewRouter.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

enum JWJWPage {
    case logInOrSignUp
    case SignUp
    case HomeCharts
    case SplashScreen
}

class ViewRouter : ObservableObject {
    @Published var currentPage : JWJWPage = .SplashScreen
}
