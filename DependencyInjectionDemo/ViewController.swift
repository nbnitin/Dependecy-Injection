//
//  ViewController.swift
//  DependencyInjectionDemo
//
//  Created by Nitin Bhatia on 01/04/23.
//

import UIKit



class ViewController: UIViewController {

    var getUsers : UsersDataProtocol!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       //let x = GetUsers(serviceManager: MockServiceManager())
        
        getUsers = DependencyContainer.shared.resolve(of: UsersDataProtocol.self)
        
        getData()
    }
    
    func getData() {
        getUsers?.getAllUsers(completionHandler: {data in
            print(data)
        })
    }


    
}

