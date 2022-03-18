//
//  SplashScreen1_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/17/22.
//

import SwiftUI

struct SplashScreen1_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        VStack {
            Text(uiConstants.headerShortText)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(uiConstants.fgTextColor)
            Image("Splash1")
            Text("Our customizable notifications will remind you when to get your body moving!")
                .multilineTextAlignment(.center)
        }.padding(50)
        
    }
}

struct SplashScreen1_View_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen1_View().environmentObject(UIConstants())
    }
}
