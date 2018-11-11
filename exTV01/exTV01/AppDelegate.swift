//
//  AppDelegate.swift
//  exTV01
//
//  Created by Felipe perius on 18/05/16.
//  Copyright © 2016 bepid. All rights reserved.
//

import UIKit
import TVMLKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tvController: TVApplicationController!
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let tvAppContext = TVApplicationControllerContext()
        
        let jsURL = NSBundle.mainBundle().URLForResource("main", withExtension:"js")
        
        tvAppContext.javaScriptApplicationURL = jsURL!
        
        
        tvController = TVApplicationController(context: tvAppContext,window: window, delegate: self)
    
        return true
    }
    
  

}

extension AppDelegate: TVApplicationControllerDelegate{
    
    func appController(appController: TVApplicationController, evaluateAppJavaScriptInContext jsContext: JSContext) {
        jsContext.setObject(ResourceLoaderExport(), forKeyedSubscript: "NativeResourceLoad")
    }
    
    
}