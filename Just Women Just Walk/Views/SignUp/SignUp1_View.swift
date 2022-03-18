//
//  SignUp1_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct SignUp1_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var formName : String
    @Binding var formEmail : String
    @Binding var formPassword : String
    
    
    
    var body: some View {
        ZStack {
            VStack {
                JWJWAppHeader_Component(isNameVisible: .constant(false))
                Spacer()
                Text("Let's get started!")
                    .font(.title)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                FormField_Component(formType: .constant(.text),
                                    labelText: .constant("Name"),
                                    fieldValue: $formName)
                FormField_Component(formType: .constant(.text),
                                    labelText: .constant("Email"),
                                    fieldValue: $formEmail)
                FormField_Component(formType: .constant(.secure),
                                    labelText: .constant("Password"),
                                    fieldValue: $formPassword)
                Spacer()
            }
        }
    }
}

struct SignUp1_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp1_View(formName: .constant(""),
                     formEmail: .constant(""),
                     formPassword: .constant(""))
            .environmentObject(UIConstants())
    }
}
