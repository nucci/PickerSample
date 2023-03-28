//
//  Times.swift
//  PickerSample
//
//  Created by Gian Nucci on 28/03/23.
//

import SwiftUI

struct Times {
    private static let times = stride(from: 0, to: 1440, by: 15).map { minutes -> Date in
        let hour = minutes / 60
        let minute = minutes % 60
        var components = DateComponents()
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components)!
    }

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()

    static var texts: [String] {
        var texts: [String] = []
        times.forEach { date in
            texts.append(timeFormatter.string(from: date).lowercased())
        }
        return texts
    }
}
