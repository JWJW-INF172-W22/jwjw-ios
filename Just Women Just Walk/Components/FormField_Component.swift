//
//  FormField_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/2/22.
//

import SwiftUI

enum FormFieldTypes {
    case text
    case secure
}

struct FormField_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var formType: FormFieldTypes
    @Binding var labelText: String
    @Binding var fieldValue: String
    
    var body: some View {
        VStack {
            HStack {
                Text(labelText)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            if (formType == .text) {
                TextField("", text: $fieldValue)
                    .overlay(CustomDivider_Component(),
                             alignment: .bottom)
            }
            else if (formType == .secure) {
                SecureField("", text: $fieldValue)
                    .overlay(CustomDivider_Component(),
                             alignment: .bottom)
            }
        }.padding()
    }
}

struct FormField_Component_Previews: PreviewProvider {
    static var previews: some View {
        FormField_Component(formType: .constant(.text),
                            labelText: .constant("Test Label"),
                            fieldValue: .constant("")).environmentObject(UIConstants())
    }
}
