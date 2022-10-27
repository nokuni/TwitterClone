//
//  FiniteSize.swift
//  TwitterClone
//
//  Created by Maertens Yann-Christophe on 26/10/22.
//

import SwiftUI

@propertyWrapper
struct FiniteSize {
    var size: CGFloat
    var minimum: CGFloat
    var wrappedValue: CGFloat {
        get { return size }
        set { size = max(newValue, UIScreen.main.bounds.width * 0.05) }
    }
    
    init() {
        size = UIScreen.main.bounds.width * 0.15
        minimum = UIScreen.main.bounds.width * 0.05
    }
    
    init(wrappedValue: CGFloat) {
        minimum = UIScreen.main.bounds.width * 0.05
        size = max(minimum, wrappedValue)
    }
    
    init(wrappedValue: CGFloat, minimum: CGFloat) {
        self.minimum = minimum
        size = max(minimum, wrappedValue)
    }
}
