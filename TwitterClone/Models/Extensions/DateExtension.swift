//
//  DateExtension.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 27/10/22.
//

import Foundation

extension Date {
    static var simpleFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: Date())
    }
}
