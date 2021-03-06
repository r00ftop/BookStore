//
//  AppDelegate.swift
//  BookApp
//
//  Created by Nguyễn Đức Huy on 10/16/20.
//

import UIKit
import FBSDKCoreKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        BookService.myBooks.getTheBooks()
        EventService.shared.getEventsFromServer()
//        while BookService.myBooks.book.isEmpty == true {
//            sleep(1)
//        }
//        let homevc = HomeScreenVC()
//        homevc.view.frame = UIScreen.main.bounds
//        self.window?.rootViewController = homevc
        
        if let token = AccessToken.current, !token.isExpired {
            print("---------- hello ------")
            let homevc = HomeScreenVC()
            self.window?.rootViewController = homevc
        }else{
            print("-----Log In Screen--------")
            let loginVC = ViewController()
            let navigationVC = UINavigationController(rootViewController: loginVC)
            self.window!.rootViewController = navigationVC
        }
        self.window?.makeKeyAndVisible()
        return true
    }
    
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
    }
    
    // MARK: UISceneSession Lifecycle
    
    //    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //        // Called when a new scene session is being created.
    //        // Use this method to select a configuration to create the new scene with.
    //        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //    }
    //
    //    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //        // Called when the user discards a scene session.
    //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //    }
    
    
}

