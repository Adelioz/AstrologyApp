//
//  DateExtension.swift
//  AstrologyApp
//
//  Created by Адель Рахимов on 24.06.2020.
//  Copyright © 2020 Адель Рахимов. All rights reserved.
//

import Foundation

extension SwipeViewController {
    func formFromPickersToTimestamp(date: Date, time: Date) -> String {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: calendar.component(.year, from: date),
                                            month: calendar.component(.month, from: date),
                                            day: calendar.component(.day, from: date),
                                            hour: calendar.component(.hour, from: time),
                                            minute: calendar.component(.minute, from: time))
        let composedDate = calendar.date(from: dateComponents)
        
        let timestamp = Int(composedDate!.timeIntervalSince1970)
        return String(timestamp)
    }
}

extension UserInfoViewController {
    func formFromPickersToTimestamp(date: Date, time: Date) -> String {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: calendar.component(.year, from: date),
                                            month: calendar.component(.month, from: date),
                                            day: calendar.component(.day, from: date),
                                            hour: calendar.component(.hour, from: time),
                                            minute: calendar.component(.minute, from: time))
        let composedDate = calendar.date(from: dateComponents)
        
        let timestamp = Int(composedDate!.timeIntervalSince1970)
        return String(timestamp)
    }
}

