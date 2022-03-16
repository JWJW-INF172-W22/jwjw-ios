//
//  HomeCharts_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/14/22.
//

import SwiftUI

struct HomeCharts_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            DailyStepsGraph_Component(
                steps: .constant(6000),
                goal: .constant(10000)
            )
        }
    }
}

struct HomeCharts_View_Previews: PreviewProvider {
    static var previews: some View {
        HomeCharts_View().environmentObject(UIConstants())
    }
}
