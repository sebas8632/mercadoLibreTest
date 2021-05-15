//
//  AppDelegate.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 11/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigation: UINavigationController = UINavigationController()
        navigation.navigationBar.backgroundColor = .yellow
        let searchView: SearchViewController = SearchRouter.createModule()

        navigation.viewControllers = [searchView]
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}
