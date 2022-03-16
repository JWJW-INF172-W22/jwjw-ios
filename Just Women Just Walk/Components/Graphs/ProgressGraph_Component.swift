//
//  ProgressGraph_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/16/22.
//

import SwiftUI

struct ProgressGraph_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var progress : Double
    @Binding var label : String
    
    @State var isHidden : Bool = false
    
    var body: some View {
        ZStack {
            if(!isHidden) {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .foregroundColor(Color.white)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(uiConstants.miniGraphFgColor)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Text(self.label)
                    Spacer()
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

struct ProgressGraph_Component_Previews: PreviewProvider {
    static var previews: some View {
        ProgressGraph_Component(
            progress: .constant(0.8),
            label: .constant("My Label")
        ).environmentObject(UIConstants())
    }
}
