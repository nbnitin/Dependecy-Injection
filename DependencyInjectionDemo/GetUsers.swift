//
//  GetUsers.swift
//  DependencyInjectionDemo
//
//  Created by Nitin Bhatia on 01/04/23.
//


protocol UsersDataProtocol {
    func getAllUsers(completionHandler : @escaping(UserModel)->Void)
}


import Foundation

class GetUsers : UsersDataProtocol {
    
    private let serviceManager : ServiceManagerProtocol
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func getAllUsers(completionHandler: @escaping (UserModel) -> Void) {
        serviceManager.getDataFromURL("https://jsonplaceholder.typicode.com/users", completionHandler: {(data: [UserModel]) in
            
            print(data.first?.id)
            
        })
    }
    
    
    
}
