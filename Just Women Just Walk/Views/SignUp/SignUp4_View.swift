//
//  SignUp4_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct SignUp4_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var formSelected : [String] = []
    @State var formStepsGoal : String = ""
    
    var body: some View {
        VStack {
            Text("Approximately how many steps do you walk each day?")
            TileSelect_Component(tileColor: .constant(.blue),
                                 choices: .constant([
                                    ["<2000", "Improve mental health"],
                                    ["Burn calories", "Get in shape"],
                                    ["Reduce stress", "Increase energy"],
                                    ["Connect with family/friends"]
                                 ]),
                                 selected: $formSelected,
                                 max: .constant(3))
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

struct SignUp4_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp4_View().environmentObject(UIConstants())
    }
}
