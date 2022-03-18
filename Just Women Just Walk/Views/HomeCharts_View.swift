//
//  HomeCharts_View.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/14/22.
//

import SwiftUI

struct HomeCharts_View: View {
    @EnvironmentObject var uiConstants : UIConstants
    
    @Binding var healthApp : HealthApp_Data
        
    let now = Date()
    let format = DateFormatter()
    
    @State var displayDate = Date()
    var displayDateText : String {
        format.locale = Locale(identifier: "en_US")
        format.dateFormat = "EEEE, MMMM dd"
        return format.string(from: displayDate)
    }
    
    @State var steps : Int = -1
    
    func setSteps(newSteps : Int) {
        self.steps = newSteps
    }
    
    func getSteps() -> Int {
        healthApp.getTodaysStep(complete: setSteps)
        return self.steps
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                uiConstants.gradientTopColor,
                uiConstants.gradientBottomColor
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
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
                    steps: .constant(getSteps()),
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
                BarGraph_Component(values: .constant([100, 200, 500, 700, 300, 400, 0]),
                                   labels: .constant(["S", "M", "T", "W", "T", "F", "S"]),
                                   highlight: .constant(5))
                Message_Component(imageSrc: .constant("undraw_walking_outside"),
                                  message: .constant("Cool down. At the end of a fast walk, walk slowly for 5 minutes to help your muscles cool down."))
            }.padding()
        }
    }
}

struct HomeCharts_View_Previews: PreviewProvider {
    static var previews: some View {
        HomeCharts_View(
            healthApp: .constant(HealthApp_Data())
        ).environmentObject(UIConstants())
    }
}
