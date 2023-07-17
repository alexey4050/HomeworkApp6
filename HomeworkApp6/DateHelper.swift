//
//  DateHelper.swift
//  HomeworkApp6
//
//  Created by testing on 17.07.2023.
//

import Foundation

final class DateHelper {
    static func getDate(date: Date?) -> String {
        guard let date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        return dateFormatter.string(from: date)
    }
}
