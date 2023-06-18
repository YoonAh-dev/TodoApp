//
//  AppDelegate.swift
//  TodoApp
//
//  Created by SHIN YOON AH on 2023/06/18.
//

import UIKit

import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    typealias TodoToggableService = Toggable & TodoService

    let container = Container()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.container.register(Repository.self) { _ in UserDefaultRepository() }
        self.container.register(TodoToggableService.self) {
            let repository = $0.resolve(Repository.self)!
            return TodoServiceImpl(repository: repository)
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

// MARK: - Swinject

func Inject<Service>(_ serviceType: Service.Type) -> Service? {
    (UIApplication.shared.delegate as? AppDelegate)?.container.resolve(serviceType)
}
