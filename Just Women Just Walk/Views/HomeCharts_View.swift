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
    
    @State var displayDate = Date()
    var displayDateText : String {
        let format = DateFormatter()
        format.locale = Locale(identifier: "en_US")
        format.dateFormat = "EEEE, MMMM dd"
        return format.string(from: displayDate)
    }
    
    @State var steps : Int = -1
    
    func setSteps(newSteps : Int) {
        self.steps = newSteps
    }
    
    func setStepsWeekly(newSteps : Int) {
        self.weeklySteps = newSteps
    }
    
    func setStepsMonthly(newSteps : Int) {
        self.monthlySteps = newSteps
    }
    
    func updateSteps() {
        healthApp.getStepsDay(complete: setSteps, day: displayDate)
        healthApp.getStepsWeek(complete: setStepsWeekly, day: displayDate)
        healthApp.getStepsMonth(complete: setStepsMonthly, day: displayDate)
        updateStepsEachDay(day: displayDate)
    }
    
    @State var weeklySteps : Int = 0
    var weeklyProgress : Double { Double(weeklySteps) / 70000 }
    
    func getDaysInMonth(day: Date) -> Int {
        return Calendar.current.dateComponents([.day],
                                               from: day.startOfMonth(),
                                               to: day.endOfMonth())
        .day!
    }
    
    @State var monthlySteps : Int = 0
    var monthlyProgress : Double { Double(monthlySteps) /
        (10000 * Double(getDaysInMonth(day: displayDate))) }
    
    @State var daysBarGraph : [Int] = [0, 0, 0, 0, 0, 0, 0]
    
    func getCompleteHandlerForDay(n : Int) -> (Int) -> Void {
        return { result in
            daysBarGraph[n] = result
        }
    }
    
    
    func updateStepsEachDay(day : Date) {
        for i in 0...daysBarGraph.count-1 {
            let currDay = Calendar.current.date(byAdding: DateComponents(day: i),
                                                to: day.startOfWeek())!
            healthApp.getStepsDay(complete: getCompleteHandlerForDay(n: i), day: currDay)
        }
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
                    HStack {
                        Button(action: {
                            displayDate = Calendar.current.date(byAdding: DateComponents(
                                day: -1,
                            second: +1), to: displayDate)!
                            updateSteps()
                        }, label: {
                            Image(systemName: "arrow.backward").foregroundColor(.black)
                        }).padding(.trailing, 50)
                        Spacer()
                    }
                    Text(displayDateText)
                        .fontWeight(.bold)
                    if (!Calendar.current.isDateInToday(displayDate)) {
                        HStack {
                            Spacer()
                            Button(action: {
                                displayDate = Calendar.current.date(byAdding: DateComponents(
                                    day: 1,
                                second: -1), to: displayDate)!
                                updateSteps()
                            }, label: {
                                Image(systemName: "arrow.forward").foregroundColor(.black)
                            }).padding(.trailing, 50)
                        }
                    }
                }
                DailyStepsGraph_Component(
                    steps: $steps,
                    goal: .constant(10000)
                ).padding()
                HStack {
                    ProgressGraph_Component(progress: .constant(monthlyProgress),
                                            label: .constant("Monthly"))
                .padding()
                    ProgressGraph_Component(progress: .constant(weeklyProgress),
                                            label: .constant("Weekly"))
                .padding()
                }
                BarGraph_Component(values: $daysBarGraph,
                                   labels: .constant(["S", "M", "T", "W", "T", "F", "S"]),
                                   highlight: .constant(5))
                Message_Component(imageSrc: .constant("undraw_walking_outside"),
                                  message: .constant("Cool down. At the end of a fast walk, walk slowly for 5 minutes to help your muscles cool down."))
            }.padding()
        }.onAppear (perform: {
            updateSteps()
        })
    }
}

struct HomeCharts_View_Previews: PreviewProvider {
    static var previews: some View {
        HomeCharts_View(
            healthApp: .constant(HealthApp_Data())
        ).environmentObject(UIConstants())
    }
}
