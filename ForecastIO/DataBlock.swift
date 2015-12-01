//
//  DataBlock.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public struct DataBlock {
    public let summary: String?
    public let icon: Icon?
    public let data: [DataPoint]?
    
    init(data: [String: AnyObject]) {
        self.summary = data["summary"] as? String
        
        if let icon = data["icon"] as? String {
            self.icon = Icon(rawValue: icon)
        } else {
            self.icon = nil
        }
        
        if let dataPoints = data["data"] as? [[String: AnyObject]] {
            self.data = []
            for dataPoint in dataPoints {
                self.data!.append(DataPoint(data: dataPoint))
            }
        } else {
            self.data = nil
        }
    }
}