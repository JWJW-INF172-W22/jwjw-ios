//
//  PageContainerComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct PageContainerComponent: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var pages : [AnyView]
    
    @State var currPage : Int = 1
    
    var body: some View {
        VStack {
            AnyView(pages[currPage - 1])
            Spacer()
            PaginatorComponent(pages: .constant(pages.count),
                               currPage: $currPage)
        }
    }
}

struct PageContainerComponent_Previews: PreviewProvider {
    static var previews: some View {
        PageContainerComponent(pages: .constant([AnyView(LoginOrSignupView())]),
                               currPage: 1)
            .environmentObject(UIConstants())
    }
}

struct PageList<T: View> {
    var destination: T
}
