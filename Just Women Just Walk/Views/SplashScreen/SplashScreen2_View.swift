//
//  SplashScreen2_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/17/22.
//

import SwiftUI

struct SplashScreen2_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        VStack {
            Text(uiConstants.headerShortText)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(uiConstants.fgTextColor)
            Image("Splash2")
            Text("Monitor your daily, weekly, and monthly progress towards your goals!")
                .multilineTextAlignment(.center)
        }.padding(50)
        
    }
}

struct SplashScreen2_View_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen2_View().environmentObject(UIConstants())
    }
}
