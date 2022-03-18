//
//  SplashScreen3_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/17/22.
//

import SwiftUI

struct SplashScreen3_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        VStack {
            Text(uiConstants.headerShortText)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(uiConstants.fgTextColor)
            Image("Splash3")
            Text("Staying active can be difficult, but we’ll be here to reward you for every goal you accomplish!")
                .multilineTextAlignment(.center)
        }.padding(50)
        
    }
}

struct SplashScreen3_View_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen3_View().environmentObject(UIConstants())
    }
}
