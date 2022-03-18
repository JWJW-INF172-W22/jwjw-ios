//
//  HealthApp_Data.swift
//  Just Women Just Walk
//
//  Created by Brandon Nguyen on 3/17/22.
//

import HealthKit

extension Calendar {
    static let gregorian = Calendar(identifier: .gregorian)
}

extension Date {
    func startOfWeek(using calendar: Calendar = .gregorian) -> Date {
        calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}

struct HealthApp_Data {
    let healthStore = HKHealthStore()
    
    init() {
        if (!HKHealthStore.isHealthDataAvailable()) {
            print("Health data not avaiable on this device.")
        }
        let readTypes = Set([
            HKObjectType.quantityType(forIdentifier: .stepCount)!
        ])
        healthStore.requestAuthorization(toShare: readTypes, read: readTypes, completion: {success, error in
            if (!success) {
                print("Error authorizing:")
                print(error!)
            }
        })
        if (healthStore.authorizationStatus(for: HKObjectType.quantityType(forIdentifier: .stepCount)!) != HKAuthorizationStatus.sharingAuthorized) {
            print("Sharing not authorized")
        }
    }
    
    func getTodaysStep(complete : @escaping (Int) -> Void) -> Void {
        let now = Date()
        let startTimeDay = Calendar.current.startOfDay(for: now)
        getSteps(complete: complete, start: startTimeDay, end: now)
    }
    
    func getStepsDay(complete : @escaping (Int) -> Void, day : Date) {
        let startTimeDay = Calendar.current.startOfDay(for: day)
        let endTimeDay = Calendar.current.date(byAdding: DateComponents(
            day: 1,
            second: -1
        ), to: startTimeDay)!
        getSteps(complete: complete, start: startTimeDay, end: endTimeDay)
    }
    
    func getStepsWeek(complete : @escaping (Int) -> Void, day : Date) {
        let startTimeWeek = day.startOfWeek()
        let endTimeWeek = Calendar.current.date(byAdding: DateComponents(
            day: 7
        ), to: startTimeWeek)!
        getSteps(complete: complete, start: startTimeWeek, end: endTimeWeek)
    }
    
    func getStepsMonth(complete : @escaping (Int) -> Void, day : Date) {
        let startTimeWeek = day.startOfMonth()
        let endTimeWeek = day.endOfMonth()
        getSteps(complete: complete, start: startTimeWeek, end: endTimeWeek)
    }
    
    func getSteps(complete : @escaping (Int) -> Void, start : Date, end : Date) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let predicate = HKQuery.predicateForSamples(withStart: start,
                                                    end: end)
        let query = HKStatisticsQuery(quantityType: stepsQuantityType,
                                      quantitySamplePredicate: predicate,
                                      options: .cumulativeSum,
                                      completionHandler: { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                complete(0)
                return
            }
            complete(Int(sum.doubleValue(for: HKUnit.count())))
        })
        
        healthStore.execute(query)
    }
    
}
