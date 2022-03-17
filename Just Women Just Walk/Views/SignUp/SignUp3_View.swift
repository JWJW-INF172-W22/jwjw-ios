//
//  SignUp3_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct SignUp3_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var formSelected: [String] = []
    
    var body: some View {
        VStack {
            CenterHeader_Component(headerText: .constant("What are your walking goals?"))
            Text("(Select up to 3)")
            TileSelect_Component(tileColor: .constant(.red),
                                 choices: .constant([
                                    ["Improve overall health", "Improve mental health"],
                                    ["Burn calories", "Get in shape"],
                                    ["Reduce stress", "Increase energy"],
                                    ["Connect with family/friends"]
                                 ]),
                                 selected: $formSelected,
                                 max: .constant(3))
        }
    }
}

struct SignUp3_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUp3_View().environmentObject(UIConstants())
    }
}
