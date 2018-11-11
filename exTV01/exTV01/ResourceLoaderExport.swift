//
//  ResourceLoaderExport.swift
//  exTV01
//
//  Created by Felipe perius on 18/05/16.
//  Copyright © 2016 bepid. All rights reserved.
//

import JavaScriptCore
import TVMLKit


@objc protocol ResourceLoader: JSExport{
    static func create() -> ResourceLoader
    
    func loadBundleResource(name: String)->String
    
}

@objc class ResourceLoaderExport: NSObject,ResourceLoader{
    
    static func create() -> ResourceLoader {
        return ResourceLoaderExport()
    }
    
    func loadBundleResource(name: String) -> String {
        let path = NSBundle.mainBundle().pathForResource(name, ofType:nil)
        
         do{
            return try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
         }catch{
            return ""
         }
    }
}