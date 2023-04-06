//
//  ServiceManager.swift
//  DependencyInjectionDemo
//
//  Created by Nitin Bhatia on 01/04/23.
//

import Foundation

protocol ServiceManagerProtocol {
    func getDataFromURL<T : Decodable>(_ url: String, completionHandler: @escaping(_ data: T)->Void)
}

class MockServiceManager : ServiceManagerProtocol {
    func getDataFromURL<T : Decodable>(_ url: String, completionHandler: @escaping(_ data: T)->Void) {
        let data = Data()
            
            let jsonData = try! JSONDecoder().decode(T.self, from: data)
            completionHandler(jsonData)
            
        
    }
}

class ServiceManager : ServiceManagerProtocol {
    
    func getDataFromURL<T : Decodable>(_ url: String, completionHandler: @escaping(_ data: T)->Void) {
        guard let url = URL(string: url) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {data,response,error in
            if let data = data {
                
                let jsonData = try! JSONDecoder().decode(T.self, from: data)
                completionHandler(jsonData)
                
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        })
        task.resume()
    }
}
