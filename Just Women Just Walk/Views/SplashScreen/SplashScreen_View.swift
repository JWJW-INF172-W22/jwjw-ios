//
//  SplashScreen_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/17/22.
//

import SwiftUI

struct SplashScreen_View: View {
    @StateObject var viewRouter: ViewRouter
    
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                uiConstants.gradientTopColor,
                uiConstants.gradientBottomColor
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button("skip", action: {
                        viewRouter.currentPage = .logInOrSignUp
                    }).foregroundColor(.black)
                }.padding()
                Spacer()
                PageContainer_Component(pages: .constant([
                    AnyView(SplashScreen1_View()),
                    AnyView(SplashScreen2_View()),
                    AnyView(SplashScreen3_View())
                ]),
                endButtonText: .constant("done"),
                endButtonAction: .constant {
                    viewRouter.currentPage = .logInOrSignUp
                })
            }
        }
        }
}

struct SplashScreen_View_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen_View(viewRouter: ViewRouter()).environmentObject(UIConstants())
    }
}
