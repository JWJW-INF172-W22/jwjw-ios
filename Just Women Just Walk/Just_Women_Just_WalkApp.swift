//
//  Just_Women_Just_WalkApp.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

@main
struct Just_Women_Just_WalkApp: App {
    @StateObject var uiConstants = UIConstants()
    var body: some Scene {
        WindowGroup {
            LoginOrSignupView().environmentObject(uiConstants)
        }
    }
}
