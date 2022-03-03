//
//  CenterHeader_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/2/22.
//

import SwiftUI

struct CenterHeader_Component: View {
    @Binding var headerText : String
    
    var body: some View {
        Text(headerText)
            .font(.title)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
    }
}

struct CenterHeader_Component_Previews: PreviewProvider {
    static var previews: some View {
        CenterHeader_Component(headerText: .constant("Test Header!"))
    }
}
