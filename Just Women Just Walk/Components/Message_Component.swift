//
//  Message_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/16/22.
//

import SwiftUI

struct Message_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var imageSrc : String
    @Binding var message : String
    
    var body: some View {
        HStack {
            Image(imageSrc)
                .resizable()
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Circle()
                                .overlay(uiConstants.messageBgColorA))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text(message)
        }.padding()
        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.white, lineWidth: 5)
                        .background(Color.white)
                        .cornerRadius(25.0))
    }
}

struct Message_Component_Previews: PreviewProvider {
    static var previews: some View {
        Message_Component(imageSrc: .constant("undraw_walking_outside"),
                          message: .constant("Cool down. At the end of a fast walk, walk slowly for 5 minutes to help your muscles cool down."))
            .environmentObject(UIConstants())
    }
}
