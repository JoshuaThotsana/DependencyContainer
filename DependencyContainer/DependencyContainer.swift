//
//  DependencyContainer.swift
//  DependencyContainer
//
//  Created by Joshua Thotsana Mabotsa on 2021/07/17.
//

import Foundation

public class DependencyContainer {
    
    private var dependencies = [String: Weak]()
    private static var shared = DependencyContainer.init()
    
    public static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }
    
    public static func resolve<T>() -> T {
        return shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        let key = "\(type(of: T.self))"
        let weak = Weak.init(value: dependency as AnyObject)
        dependencies[key] = weak
    }
    
    private func resolve<T>() -> T {
        let key = "\(type(of: T.self))"
        let weak = dependencies[key]
        
        precondition(weak != nil, "No dependency registered for \(key), Application must register a dependency before resolving it.")
        
        let dependency = weak!.value as? T
        
        precondition(dependency != nil, "No dependency registered for \(key), Dependency is already deallocated by the system.")
        
        return dependency!
    }
    
}
