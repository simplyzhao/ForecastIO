//
//  FlagsObject.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public struct FlagsObject {
    public let darkskyUnavailable: Bool?
    public let darkSkyStations: [String]?
    public let datapointStations: [String]?
    public let isdStations: [String]?
    public let lampStations: [String]?
    public let metarStations: [String]?
    public let metnoLicense: Bool?
    public let sources: [String]?
    public let units: String?
    
    init(data: [String: AnyObject]) {
        self.darkskyUnavailable = data["darksky-unavailable"] as? Bool
        self.darkSkyStations = data["darksky-stations"] as? [String]
        self.datapointStations = data["datapoint-stations"] as? [String]
        self.isdStations = data["isd-stations"] as? [String]
        self.lampStations = data["lamp-stations"] as? [String]
        self.metarStations = data["metar-stations"] as? [String]
        self.metnoLicense = data["metno-license"] as? Bool
        self.sources = data["sources"] as? [String]
        self.units = data["units"] as? String
    }
}