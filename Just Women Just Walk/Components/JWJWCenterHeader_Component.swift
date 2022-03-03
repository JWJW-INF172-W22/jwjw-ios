//
//  JWJWCenterHeader_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct JWJWCenterHeader_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    var body: some View {
        CenterHeader_Component(headerText: .constant(uiConstants.headerText))
    }
}

struct JWJWHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        JWJWCenterHeader_Component().environmentObject(UIConstants())
    }
}
