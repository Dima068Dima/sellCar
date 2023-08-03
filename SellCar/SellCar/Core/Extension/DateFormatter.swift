//
//  DateFormatter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 04.08.2023.
//

import Foundation

enum DateElements: String {
    case day = "d"
    case month = "MMMM"
    case monthNumbers = "MM"
    case year = "yyyy г."
    case monthInNominativeCase = "LLLL" // Именительный падеж: Декабрь, Январь, Апрель ...
    case dayWithPoint = "dd."
    case monthNumbersWithPoint = "MM."
    case hours = "HH"
    case minutes = "mm"
}

extension Date {
    fileprivate func toString(elements: [DateElements]) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        dateFormatter.timeZone = TimeZone.current
        var editStyle: String = ""
        elements.forEach{ editStyle += " \($0.rawValue)"}
        dateFormatter.dateFormat = editStyle

        return dateFormatter.string(from: self)
    }
}

extension String {
    func toStringDate(elements: DateElements...) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self)
        let formattedDateString = date?.toString(elements: elements)

        return formattedDateString
    }
}
