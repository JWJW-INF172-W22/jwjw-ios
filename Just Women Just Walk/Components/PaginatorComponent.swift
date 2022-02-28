//
//  PaginatorComponent.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 2/27/22.
//

import SwiftUI

struct PaginatorComponent: View {
    @Binding var pages: Int
    @Binding var currPage: Int
    
    var pagesAfter: Int { return pages - currPage }
    var pagesBefore: Int { return currPage - 1 }
    
    
    var body: some View {
        HStack {
            if(currPage > 1) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.backward").foregroundColor(.black)
                }).padding(.leading)
            }
            Spacer()
            ForEach(0 ..< pagesBefore) { _ in
                Image(systemName: "circle.fill").foregroundColor(.black)
            }
            Image(systemName: "rectangle.fill").foregroundColor(.black)
            ForEach(0 ..< pagesAfter) { _ in
                Image(systemName: "circle.fill").foregroundColor(.black)
            }
            Spacer()
            if(currPage < pages) {
                Button(action: {}, label: {
                    Image(systemName: "arrow.forward").foregroundColor(.black)
                }).padding(.trailing)
            }
        }
    }
}

struct PaginatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        PaginatorComponent(pages: .constant(6),
                           currPage: .constant(3))
    }
}
