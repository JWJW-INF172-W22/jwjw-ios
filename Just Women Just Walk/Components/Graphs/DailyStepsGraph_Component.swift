//
//  DailyStepsGraph_Component.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/8/22.
//

import SwiftUI

struct DailyStepsGraph_Component: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var steps: Int
    @Binding var goal: Int
    var progress: Float { Float(steps) / Float(goal) }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .foregroundColor(Color.white)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(uiConstants.graphFgColor)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text("\(self.steps)\nSteps")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
    }
}

struct DailyStepsGraph_Component_Previews: PreviewProvider {
    static var previews: some View {
        DailyStepsGraph_Component(steps: .constant(6000),
                                  goal: .constant(10000))
            .environmentObject(UIConstants())
    }
}
