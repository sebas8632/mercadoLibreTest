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
        let searchView: SearchViewController = SearchRouter.createModule()
        
        window?.rootViewController = searchView
        window?.makeKeyAndVisible()
        return true
    }
}
