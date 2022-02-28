//
//  SignUp1_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct SignUp1_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var formUsername : String = ""
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UIScrollView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack {
                JWJWAppHeaderComponent(isNameVisible: .constant(false))
                Form {
                    TextField("Name", text: $formUsername)
                        .textFieldStyle(PlainTextFieldStyle())
                        .background(Color.clear)
                        .foregroundColor(.clear)
                }
            }
        }
    }
}

struct SignUp1_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp1_View().environmentObject(UIConstants())
    }
}
