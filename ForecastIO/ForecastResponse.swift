//
//  ForecastResponse.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public struct ForecastResponse {
    public let latitude: Double?
    public let longitude: Double?
    public let timezone: String?
    public let offset: Int?
    public let currently: DataPoint?
    public let minutely: DataBlock?
    public let hourly: DataBlock?
    public let daily: DataBlock?
    public let alerts: [AlertObject]?
    public let flags: FlagsObject?
    
    init(response: [String: AnyObject]) {
        self.latitude = response["latitude"] as? Double
        self.longitude = response["longitude"] as? Double
        self.timezone = response["timezone"] as? String
        self.offset = response["offset"] as? Int
        
        if let currentlyData = response["currently"] as? [String: AnyObject] {
            self.currently = DataPoint(data: currentlyData)
        } else {
            self.currently = nil
        }
        
        if let minutelyData = response["minutely"] as? [String: AnyObject] {
            self.minutely = DataBlock(data: minutelyData)
        } else {
            self.minutely = nil
        }
        
        if let hourlyData = response["hourly"] as? [String: AnyObject] {
            self.hourly = DataBlock(data: hourlyData)
        } else {
            self.hourly = nil
        }
        
        if let dailyData = response["daily"] as? [String: AnyObject] {
            self.daily = DataBlock(data: dailyData)
        } else {
            self.daily = nil
        }
        
        if let alertsData = response["alerts"] as? [[String: AnyObject]] {
            self.alerts = []
            for alertData in alertsData {
                self.alerts!.append(AlertObject(data: alertData))
            }
        } else {
            self.alerts = nil
        }
        
        if let flagsData = response["flags"] as? [String: AnyObject] {
            self.flags = FlagsObject(data: flagsData)
        } else {
            self.flags = nil
        }
    }
}