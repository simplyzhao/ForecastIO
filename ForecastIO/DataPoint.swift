//
//  DataPoint.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public enum PrecipType: String {
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Hail = "hail"
}

public struct DataPoint {
    public let time: NSTimeInterval?
    public let summary: String?
    public let icon: Icon?
    public let sunriseTime: NSTimeInterval?
    public let sunsetTime: NSTimeInterval?
    public let moonPhase: Double?
    public let nearestStormDistance: Double?
    public let nearestStormBearing: Double?
    public let precipIntensity: Double?
    public let precipIntensityMax: Double?
    public let precipIntensityMaxTime: NSTimeInterval?
    public let precipProbability: Double?
    public let precipType: PrecipType?
    public let precipAccumulation: Double?
    public let temperature: Double?
    public let temperatureMin: Double?
    public let temperatureMinTime: NSTimeInterval?
    public let temperatureMax: Double?
    public let temperatureMaxTime: NSTimeInterval?
    public let apparentTemperature: Double?
    public let apparentTemperatureMin: Double?
    public let apparentTemperatureMinTime: NSTimeInterval?
    public let apparentTemperatureMax: Double?
    public let apparentTemperatureMaxTime: NSTimeInterval?
    public let dewPoint: Double?
    public let windSpeed: Double?
    public let windBearing: Double?
    public let cloudCover: Double?
    public let humidity: Double?
    public let pressure: Double?
    public let visibility: Double?
    public let ozone: Double?
    
    init(data: [String: AnyObject]) {
        self.time = data["time"] as? NSTimeInterval
        self.summary = data["summary"] as? String
        
        if let icon = data["icon"] as? String {
            self.icon = Icon(rawValue: icon)
        } else {
            self.icon = nil
        }
        
        self.sunriseTime = data["sunriseTime"] as? NSTimeInterval
        self.sunsetTime = data["sunsetTime"] as? NSTimeInterval
        self.moonPhase = data["moonPhase"] as? Double
        self.nearestStormDistance = data["nearestStormDistance"] as? Double
        self.nearestStormBearing = data["nearestStormBearing"] as? Double
        self.precipIntensity = data["precipIntensity"] as? Double
        self.precipIntensityMax = data["precipIntensityMax"] as? Double
        self.precipIntensityMaxTime = data["precipIntensityMaxTime"] as? NSTimeInterval
        self.precipProbability = data["precipProbability"] as? Double
        
        if let precipType = data["recipType"] as? String {
            self.precipType = PrecipType(rawValue: precipType)
        } else {
            self.precipType = nil
        }
        
        self.precipAccumulation = data["precipAccumulation"] as? Double
        self.temperature = data["temperature"] as? Double
        self.temperatureMin = data["temperatureMin"] as? Double
        self.temperatureMinTime = data["temperatureMinTime"] as? NSTimeInterval
        self.temperatureMax = data["temperatureMax"] as? Double
        self.temperatureMaxTime = data["temperatureMaxTime"] as? NSTimeInterval
        self.apparentTemperature = data["apparentTemperature"] as? Double
        self.apparentTemperatureMin = data["apparentTemperatureMin"] as? Double
        self.apparentTemperatureMinTime = data["apparentTemperatureMinTime"] as? NSTimeInterval
        self.apparentTemperatureMax = data["apparentTemperatureMax"] as? Double
        self.apparentTemperatureMaxTime = data["apparentTemperatureMaxTime"] as? NSTimeInterval
        self.dewPoint = data["dewPoint"] as? Double
        self.windSpeed = data["windSpeed"] as? Double
        self.windBearing = data["windBearing"] as? Double
        self.cloudCover = data["cloudCover"] as? Double
        self.humidity = data["humidity"] as? Double
        self.pressure = data["pressure"] as? Double
        self.visibility = data["visibility"] as? Double
        self.ozone = data["ozone"] as? Double
    }
}