//
//  Forecast.io.swift
//  Weather
//
//  Created by Alex Zhao on 11/25/15.
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public protocol ForecastIODelegate: class {
    func handlesForecastResponse(response: ForecastResponse)
    func handlesForecastError(error: NSError)
}

public class ForecastIO {
    // Singleton
    public static let sharedInstance = ForecastIO()
    
    // Delegate
    public weak var delegate: ForecastIODelegate?
    
    // Forecast API required fields (https://developer.forecast.io/)
    private let apiKey: String = "f2fd4105de5163646596076704638ac2"
    private static let apiFixedURL: String = "https://api.forecast.io/forecast/"
    
    private let session = NSURLSession.sharedSession()
    
    private init() {
        print("Forecast initialized with API Key: \(self.apiKey)")
    }
    
    typealias CompletionHandler = (NSData?, NSURLResponse?, NSError?) -> Void
    private lazy var completionHandler: CompletionHandler = {
        [weak self] (data: NSData?, response: NSURLResponse?, error: NSError?) in
        if error != nil {
            self?.delegate?.handlesForecastError(error!);
        } else {
            if let responseData = (try? NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers)) as? [String: AnyObject] {
                let response = ForecastResponse(response: responseData)
                self?.delegate?.handlesForecastResponse(response)
            }
        }
    }
    
    public func forecast(latitude lat: Double, longitude lon: Double) -> Void {
        let apiURL = ForecastIO.apiFixedURL + self.apiKey + "/\(lat),\(lon)"
        if let url = NSURL(string: apiURL) {
            let task = session.dataTaskWithURL(url, completionHandler: completionHandler)
            task.resume()
        }
    }
    
    public func forecast(latitude lat: Double, longitude lon: Double, time: NSTimeInterval) -> Void {
        let apiURL = ForecastIO.apiFixedURL + self.apiKey + "/\(lat),\(lon),\(time)"
        if let url = NSURL(string: apiURL) {
            let task = session.dataTaskWithURL(url, completionHandler: completionHandler)
            task.resume()
        }
    }
}
