//
//  AlertObject.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public struct AlertObject {
    public let title: String?
    public let expires: NSTimeInterval?
    public let description: String?
    public let uri: NSURL?
    
    init(data: [String: AnyObject]) {
        self.title = data["title"] as? String
        self.expires = data["expires"] as? NSTimeInterval
        self.description = data["description"] as? String
        
        if let uriString = data["uri"] as? String {
            self.uri = NSURL(string: uriString)
        } else {
            self.uri = nil
        }
    }
}