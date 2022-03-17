//
//  BarGraph_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/16/22.
//

import SwiftUI

struct BarGraph_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var values : [Int]
    @Binding var labels : [String]
    @Binding var highlight : Int
    
    @State var isHidden = false
        
    var body: some View {
        ZStack {
            if (!isHidden) {
                HStack {
                    ForEach (0..<values.count) { n in
                        VStack{
                            Spacer()
                            Rectangle()
                                .stroke((n == highlight) ? uiConstants.graphFgColor : uiConstants.miniGraphFgColor, lineWidth: 2)
                                .background((n == highlight) ? uiConstants.graphFgColor : uiConstants.miniGraphFgColor)
                                .frame(width: 20,
                                       height: (CGFloat) (100 * values[n] / values.max()!))
                            Text(labels[n])
                        }
                    }
                }
            }
            HStack {
                Spacer()
                VStack {
                    Button(action:{
                        isHidden.toggle()
                    }, label: {
                        if(isHidden) {
                            Text("SHOW")
                        }
                        else {
                            Text("HIDE")
                        }
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                }
            }
        }
    }
}

struct BarGraph_Component_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph_Component(values: .constant([100, 200, 500, 700, 300, 400, 0]),
                           labels: .constant(["S", "M", "T", "W", "T", "F", "S"]),
                           highlight: .constant(5))
            .environmentObject(UIConstants())
    }
}
