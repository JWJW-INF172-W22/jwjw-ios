//
//  PageContainerComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct PageContainer_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var pages : [AnyView]
    
    @State var currPage : Int = 1
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack {
                AnyView(pages[currPage - 1])
                Spacer()
                Paginator_Component(pages: .constant(pages.count),
                                   currPage: $currPage)
            }
        }
    }
}

//struct PageContainerComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        PageContainer_Component(pages: .constant([AnyView(LoginOrSignup_View())]),
//                               currPage: 1)
//            .environmentObject(UIConstants())
//    }
//}
