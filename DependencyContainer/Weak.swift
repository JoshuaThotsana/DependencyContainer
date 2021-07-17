//
//  Weak.swift
//  DependencyContainer
//
//  Created by Joshua Thotsana Mabotsa on 2021/07/17.
//

import Foundation

class Weak: Equatable {

    weak var value: AnyObject?
    
    init(value: AnyObject) {
        self.value = value
    }
    
    static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value === rhs.value
    }
    
}
