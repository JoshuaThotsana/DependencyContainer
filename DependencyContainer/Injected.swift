//
//  Injected.swift
//  DependencyContainer
//
//  Created by Joshua Thotsana Mabotsa on 2021/07/17.
//

import Foundation

@propertyWrapper
class Injected<T> {
        
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
    
}

class AccountManagger {
    
    
    
}

class ABC {
    
    @Injected var accountManager: AccountManagger
    
}
