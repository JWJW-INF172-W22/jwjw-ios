//
//  CustomDividerComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct CustomDividerComponent: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(height: uiConstants.dividerLineWidth)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct CustomDividerComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomDividerComponent().environmentObject(UIConstants())
    }
}
