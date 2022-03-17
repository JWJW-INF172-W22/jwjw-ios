//
//  SignUp2_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/3/22.
//

import SwiftUI

struct SignUp2_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var formDog : String
    @Binding var formZip : String
    @Binding var formAge : String
    @Binding var formConditions : String
    
    var body: some View {
        VStack {
            JWJWAppHeader_Component(isNameVisible: .constant(false))
            Spacer()
            
            CenterHeader_Component(headerText: .constant("Can you share a few details about yourself?"))
            RadioButtonGroup_Component(labelText: .constant("Do you have a dog that you walk daily?"),
                                       buttonText: .constant([["Yes", "No"]]),
                                       selectedText: $formDog
                                       )
            FormField_Component(formType: .constant(.text),
                                labelText: .constant("What is your zip code?"),
                                fieldValue: $formZip)
            RadioButtonGroup_Component(labelText: .constant("I am in my..."),
                                       buttonText: .constant([["Teens", "20s", "30s", "40s"], ["50s", "60s", "70s", "80s"]]),
                                       selectedText: $formAge
                                       )
            DropDown_Component(selected: $formConditions,
                               choices: .constant(["High blood pressure", "High cholesterol", "Arthritis", "Heart disease", "Diabetes", "Chronic Depression"]),
                               labelText: .constant("Chronic Conditions"))
            Spacer()
        }
    }
}

struct SignUp2_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp2_View(formDog: .constant(""),
                     formZip: .constant(""),
                     formAge: .constant(""),
                     formConditions: .constant("")
        ).environmentObject(UIConstants())
    }
}
