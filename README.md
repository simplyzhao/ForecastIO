# ForecastIO
Swift framework for forecast.io

## How-to

### Integrate using CocoaPods
You can use [Cocoapods](http://cocoapods.org/) to install `ForecastIO`by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

source 'https://github.com/simplyzhao/ZLPodSpecs.git'

target 'YourApp' do
  pod 'ForecastIO', '~> 0.12.10'
end
```

### Demo Code
```swift
import UIKit
import ForecastIO

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Send Forecast API request
        ForecastIO.sharedInstance.delegate = self
        ForecastIO.sharedInstance.forecast(latitude: 31.2, longitude: 121.5)  // Location: Shanghai
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ForecastIODelegate {
    func handlesForecastResponse(response: ForecastResponse) {

    }
    
    func handlesForecastError(error: NSError) {
        
    }
}
```
