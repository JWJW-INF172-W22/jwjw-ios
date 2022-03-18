//
//  SignUp3_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/18/22.
//

import SwiftUI

struct SignUp3_View: View {
    @Binding var formSelected : [String]
    
    var body: some View {
        VStack {
            CenterHeader_Component(headerText: .constant("Do you have any chronic conditions?"))
            TileSelect_Component(tileColor: .constant(.purple),
                                 choices: .constant([
                                    ["High blood pressure", "High cholesterol"],
                                    ["Arthritis", "Heart disease"],
                                    ["Diabetes", "Chronic Depression"],
                                 ]),
                                 selected: $formSelected,
                                 max: .constant(0))
        }
    }
}

struct SignUp3_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp3_View(formSelected: .constant([]))
    }
}
