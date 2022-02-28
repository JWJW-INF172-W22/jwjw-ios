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
        UITextField.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack {
                JWJWAppHeaderComponent(isNameVisible: .constant(false))
                Form {
                    TextField("Name", text: $formUsername)
                        .background(Rectangle().fill(uiConstants.bgColor).frame(width:400, height: 50))
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
