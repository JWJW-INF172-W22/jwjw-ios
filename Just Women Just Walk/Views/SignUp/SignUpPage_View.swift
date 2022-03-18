//
//  SignUpPage_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct SignUpPage_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var formName : String = ""
    @State var formEmail : String = ""
    @State var formPassword : String = ""
    @State var formDog : String = ""
    @State var formZip : String = ""
    @State var formAge : String = ""
    @State var formConditions : String = "" 
    
    var body: some View {
        PageContainer_Component(pages: .constant([
            AnyView(SignUp1_View(formName: $formName,
                         formEmail: $formEmail,
                         formPassword: $formPassword)),
            AnyView(SignUp2_View(formDog: $formDog,
                         formZip: $formZip,
                         formAge: $formAge,
                         formConditions: $formConditions)),
            AnyView(SignUp3_View()),
            AnyView(SignUp4_View())
        ]))
    }
}

struct SignUpPage_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage_View().environmentObject(UIConstants())
    }
}
