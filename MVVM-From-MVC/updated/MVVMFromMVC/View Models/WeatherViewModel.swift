import Foundation

// MARK : STEP1 - Creating WeatherViewModel

//1 - No other UIKit types need to be permitted in the view model. A general rule of thumb is to never import UIKit in your view models.
import UIKit.UIImage

//2 - You make it public in order for it to be accessible for testing.
public class WeatherViewModel {
  private static let defaultAddress = "Anchorage, AK" // sets a default address
  private let geocoder = LocationGeocoder() // 지역 이름을 받아와 이를 Weather Service에 보내 위도 경도 변환
  let locationName = Box("Loading...")
  
  // MARK : STEP2 - Formatting Data in MVVM
  
  private let dateFormatter: DateFormatter = { // formats the date display
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d"
    return dateFormatter
  }()
  private let tempFormatter: NumberFormatter = { // helps present the temperature as an integer value
    let tempFormatter = NumberFormatter()
    tempFormatter.numberStyle = .none
    return tempFormatter
  }()
  
  let date = Box(" ")
  
  let icon: Box<UIImage?> = Box(nil)  //no image initially
  let summary = Box(" ")
  let forecastSummary = Box(" ")

  init() {
    changeLocation(to: Self.defaultAddress)
  }
  
  func changeLocation(to newLocation: String) {
    locationName.value = "Loading..."
    geocoder.geocode(addressString: newLocation) { [weak self] locations in
      guard let self = self else { return }
      if let location = locations.first {
        self.locationName.value = location.name
        self.fetchWeatherForLocation(location)
        return
      }
      
      self.locationName.value = "Not found"
      self.date.value = ""
      self.icon.value = nil
      self.summary.value = ""
      self.forecastSummary.value = ""
    }
  }
  
  private func fetchWeatherForLocation(_ location: Location) {
    WeatherbitService.weatherDataForLocation(
      latitude: location.latitude,
      longitude: location.longitude) { [weak self] (weatherData, error) in
        guard
          let self = self,
          let weatherData = weatherData
          else {
            return
          }
      
      //
      self.date.value = self.dateFormatter.string(from: weatherData.date)
      
      self.icon.value = UIImage(named: weatherData.iconName)
      let temp = self.tempFormatter
        .string(from: weatherData.currentTemp as NSNumber) ?? ""
      self.summary.value = "\(weatherData.description) - \(temp)℉"
      self.forecastSummary.value = "\nSummary: \(weatherData.description)"
    }
  }
  
}
