//
//  SignUpPage_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/5/22.
//

import SwiftUI

struct SignUpPage_View: View {
    @StateObject var viewRouter: ViewRouter
    
    @EnvironmentObject var uiConstants : UIConstants
    
    @State var formName : String = ""
    @State var formEmail : String = ""
    @State var formPassword : String = ""
    @State var formDog : String = ""
    @State var formZip : String = ""
    @State var formAge : String = ""
    @State var formConditions : String = "" 
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                uiConstants.gradientTopColor,
                uiConstants.gradientBottomColor
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
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
            ]),
                                    endButtonText: .constant("submit"),
                                    endButtonAction: .constant {
                viewRouter.currentPage = .HomeCharts
            })
        }
    }
}

struct SignUpPage_View_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage_View(viewRouter: ViewRouter()).environmentObject(UIConstants())
    }
}
