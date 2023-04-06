# Dependecy-Injection


Dependency Injection is a software design pattern that allows you to use a technique in which an object receives other objects that it depends on. These other objects are called dependencies.

To implement the Dependency Injection pattern, we will use the Inversion of Control principle.

Inversion of Control is a programming principle. IoC inverts the flow of control as compared to traditional control flow. In IoC, custom-written portions of a computer program receive the flow of control from a generic framework.

To achieve the “inverting the flow of control” we have a technique. With this technique, we aim that construct all of the responsibilities of the class to its dependencies.

To make more readable, reusable code, maintainable code, and testable code, we can abstract the code, and the abstraction will provide a few types of implementation.

One more advantage of abstraction is that we can eliminate tightly coupled(decouple classes) relationships between classes. All the decoupled classes make it easy to do some stuff I mentioned above.

We can implement the Dependency Injection in several ways. These ways are Initializer Injection, Setter Injection(a.k.a Property Injection), and Interface Injection.



**Initializer Injection** is a most favorite way to inject dependencies, and also it’s my favorite solution to inject objects. You can also see it called Constructor Injection somewhere, both are completely the same.

In this way, we pass all the dependencies as initializer parameters.

protocol UserServiceProtocol {
    func fetchUsers()
}

protocol RewardServiceProtocol {
    func fetchRewards()
}

final class ViewModel {

    private let userService: UserServiceProtocol
    private let rewardService: RewardServiceProtocol

    init(userService: UserServiceProtocol, rewardService: RewardServiceProtocol) {
        self.userService = userService
        self.rewardService = rewardService
    }

}


#Another dependencies injection way is **Setter Injection(a.k.a Property Injection)**

protocol UserServiceProtocol {
    func fetchUsers()
}

protocol RewardServiceProtocol {
    func fetchRewards()
}

final class ViewModel {

    private var userService: UserServiceProtocol?
    private var rewardService: RewardServiceProtocol?

    func setUserService(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func setRewardService(rewardService: RewardServiceProtocol) {
        self.rewardService = rewardService
    }

}

#The latest Dependencies Injection way is **Interface Injection**.

protocol UserServiceProtocol {
    func fetchUsers()
}

protocol RewardServiceProtocol {
    func fetchRewards()
}

protocol ServiceProtocol {
    func users(service: UserServiceProtocol)
    func rewards(service: RewardServiceProtocol)
}


final class ViewModel: ServiceProtocol {
    
    private var userService: UserServiceProtocol?
    private var rewardService: RewardServiceProtocol?
    
    func users(service: UserServiceProtocol) {
        self.userService = service
    }
    
    func rewards(service: RewardServiceProtocol) {
        self.rewardService = service
    }
    
}

In this example, we created a protocol named ServiceProtocol that injects UserServiceProtocol and RewardServiceProtocol.
Also, this way provides more advantages than the second way. We can prefer that over second.
The ServiceProtocol completely doesn’t know the implementation.

By confirming the ServiceProtocol, the code gets loosely coupled.

**A Dependency Injection Container is an object that is responsible for recording, deciding, and settling all the dependencies. Responsibilities of the deciding and settling mean that the DI container needs to know about the constructor arguments and the relationships between the objects.**

**and project has an example of Dependency Injection Container**

