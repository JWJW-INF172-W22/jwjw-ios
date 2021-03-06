//
//  PaginatorComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct Paginator_Component: View {
    @Binding var pages: Int
    @Binding var currPage: Int
    @Binding var endButtonText: String
    @State var endButtonAction: () -> Void
    
    
    var body: some View {
        ZStack {
            HStack {
                if(currPage > 1) {
                    Button(action: {
                        currPage = currPage - 1
                    }, label: {
                        Image(systemName: "arrow.backward").foregroundColor(.black)
                    }).padding(.leading, 50)
                }
                Spacer()
            }
            HStack {
                ForEach(0 ..< (currPage - 1), id: \.self) { _ in
                    Image(systemName: "circle.fill").foregroundColor(.black)
                }
                Image(systemName: "rectangle.fill").foregroundColor(.black)
                ForEach(0 ..< (pages - currPage), id: \.self) { _ in
                    Image(systemName: "circle.fill").foregroundColor(.black)
                }
            }
            HStack {
                Spacer()
                if(currPage < pages) {
                    Button(action: {
                        currPage = currPage + 1
                    }, label: {
                        Image(systemName: "arrow.forward").foregroundColor(.black)
                    }).padding(.trailing, 50)
                }
                else {
                    Button(action: { endButtonAction() },
                           label: { Text(endButtonText) }
                           ).padding(.trailing, 50)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct PaginatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        Paginator_Component(pages: .constant (6),
                            currPage: .constant(6),
                            endButtonText: .constant("submit"),
                            endButtonAction: {print("endPressed")})
    }
}
