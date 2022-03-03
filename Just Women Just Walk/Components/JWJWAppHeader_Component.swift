//
//  JWJWAppHeaderComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct JWJWAppHeader_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var isNameVisible : Bool
    var namedUser : Binding<String>?
    
    var body: some View {
        VStack {
            HStack {
                if (isNameVisible) {
                    Text("Hi, \(namedUser!.wrappedValue)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                }
                Spacer()
                Text(uiConstants.headerShortText)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(uiConstants.fgTextColor)
                    .padding(.trailing)
            }
            CustomDivider_Component()
        }
    }
}

struct JWJWAppHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        JWJWAppHeader_Component(isNameVisible: .constant(true),
                               namedUser: .constant("Catherine"))
            .environmentObject(UIConstants())
    }
}
