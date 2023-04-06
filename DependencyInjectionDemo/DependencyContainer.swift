//
//  DependencyContainer.swift
//  DependencyInjectionDemo
//
//  Created by Nitin Bhatia on 01/04/23.
//

import Foundation

class DependencyContainer {
    
    public static var shared = DependencyContainer()
    private var services: [String: Any] = [:]
    
    private let serviceManager : ServiceManager = ServiceManager()
    
    func registerAssembely() {
        DependencyContainer.shared.register(
            interface: UsersDataProtocol.self, service: GetUsers(serviceManager: serviceManager)
        )
        
    }
    
    // Adding services to the list
    func register<T>(interface: T.Type, service: T) {
        let key = String(describing: interface)
        services[key] = service
    }
    
    // Extracting services to the list
    func resolve<T>() -> T {
        let key = String(describing: T.self)
        return services[key] as! T
    }
    
    func resolve<T>(of type: T.Type) -> T {
        let key = String(describing: type)
        return services["\(type)"] as! T
    }
}
