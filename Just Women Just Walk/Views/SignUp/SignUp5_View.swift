//
//  SignUp5_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct SignUp5_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var formSelected : [String]
    @Binding var formStepsGoal : String
    
    var body: some View {
        VStack {
            Text("Approximately how many steps do you walk each day?")
            TileSelect_Component(tileColor: .constant(.blue),
                                 choices: .constant([
                                    ["<2000", "2,000-3,000"],
                                    ["3,001-5,000", "5,001-8000"],
                                    ["8,001-10,000+", "Not sure"],
                                 ]),
                                 selected: $formSelected,
                                 max: .constant(1))
            DropDown_Component(selected: $formStepsGoal,
                               choices: .constant([
                                "2000 steps (14,000 weekly)",
                                "3000 steps (21,000 weekly)",
                                "4000 steps (28,000 weekly)",
                                "5000 steps (35,000 weekly)",
                                "6000 steps (42,000 weekly)",
                                "7000 steps (49,000 weekly)",
                                "8000 steps (56,000 weekly)",
                                "9000 steps (63,000 weekly)",
                                "10,000 steps (70,000 weekly)",
                               ]),
                               labelText: .constant("My daily step goal is..."))
        }
    }
}

struct SignUp5_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp5_View(formSelected: .constant([]),
                     formStepsGoal: .constant(""))
        .environmentObject(UIConstants())
    }
}
