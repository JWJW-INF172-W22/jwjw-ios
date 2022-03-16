//
//  HomeCharts_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/14/22.
//

import SwiftUI

struct HomeCharts_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    let now = Date()
    let format = DateFormatter()
    
    @State var displayDate = Date()
    var displayDateText : String {
        format.locale = Locale(identifier: "en_US")
        format.dateFormat = "EEEE, MMMM dd"
        return format.string(from: displayDate)
    }
    
    var body: some View {
        ZStack {
            uiConstants.bgColor.ignoresSafeArea()
            VStack{
                ZStack {
                    Text(displayDateText)
                        .fontWeight(.bold)
                    HStack {
                        Text("<")
                        Spacer()
                        Text(">")
                    }
                }
                DailyStepsGraph_Component(
                    steps: .constant(6000),
                    goal: .constant(10000)
                ).padding()
                HStack {
                    ProgressGraph_Component(progress: .constant(0.3),
                                            label: .constant("Monthly"))
                .padding()
                    ProgressGraph_Component(progress: .constant(0.7),
                                            label: .constant("Weekly"))
                .padding()
            }
            }.padding()
        }
    }
}

struct HomeCharts_View_Previews: PreviewProvider {
    static var previews: some View {
        HomeCharts_View().environmentObject(UIConstants())
    }
}
