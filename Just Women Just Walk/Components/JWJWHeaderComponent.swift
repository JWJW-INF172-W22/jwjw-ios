//
//  JWJWHeaderComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct JWJWHeaderComponent: View {
    @EnvironmentObject var uiConstants : UIConstants
    var body: some View {
        Text(uiConstants.headerText)
            .font(.title)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
    }
}

struct JWJWHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        JWJWHeaderComponent().environmentObject(UIConstants())
    }
}
