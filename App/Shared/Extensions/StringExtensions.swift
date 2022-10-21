//
//  StringExtensions.swift
//  BoomJar (iOS)
//
//  Created by Kyle Morton on 10/20/22.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "MM/dd/yyyy")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}
