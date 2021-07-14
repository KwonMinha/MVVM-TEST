import UIKit

class WeatherViewController: UIViewController {
  
  /*
  private let geocoder = LocationGeocoder() // 지역 이름을 받아와 이를 Weather Service에 보내 위도 경도 변환
  private let defaultAddress = "McGaheysville, VA" // sets a default address
  */
  
  /*
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
  */
  
  private let viewModel = WeatherViewModel()
  
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentIcon: UIImageView!
  @IBOutlet weak var currentSummaryLabel: UILabel!
  @IBOutlet weak var forecastSummary: UITextView!
  
  override func viewDidLoad() {
    /*
    // convert defaultAddress into a Location
    geocoder.geocode(addressString: defaultAddress) { [weak self] locations in
      guard
        let self = self,
        let location = locations.first
        else {
          return
        }
      self.cityLabel.text = location.name
      self.fetchWeatherForLocation(location)
    }
    */
    
    viewModel.locationName.bind { [weak self] locationName in
      self?.cityLabel.text = locationName
    }
    
    //
    
    viewModel.date.bind { [weak self] date in
      self?.dateLabel.text = date
    }
    
    viewModel.icon.bind { [weak self] image in
      self?.currentIcon.image = image
    }
        
    viewModel.summary.bind { [weak self] summary in
      self?.currentSummaryLabel.text = summary
    }
        
    viewModel.forecastSummary.bind { [weak self] forecast in
      self?.forecastSummary.text = forecast
    }
  }
  
  @IBAction func promptForLocation(_ sender: Any) {
    //1 - Create a UIAlertController with a text field.
    let alert = UIAlertController(
      title: "Choose location",
      message: nil,
      preferredStyle: .alert)
    alert.addTextField()
    
    //2 - The action passes the new location string to viewModel.changeLocation(to:).
    let submitAction = UIAlertAction(
      title: "Submit",
      style: .default) { [unowned alert, weak self] _ in
        guard let newLocation = alert.textFields?.first?.text else { return }
        self?.viewModel.changeLocation(to: newLocation)
    }
    alert.addAction(submitAction)
    
    //3 - Present the alert.
    present(alert, animated: true)

  }

  /*
  func fetchWeatherForLocation(_ location: Location) {
    //1 - Calls the weather service and passes it the location’s latitude and longitude.
    WeatherbitService.weatherDataForLocation(
      latitude: location.latitude,
      longitude: location.longitude) { [weak self] (weatherData, error) in
      //2 - Updates the views with the weather data provided by the weather service callback.
      guard
        let self = self,
        let weatherData = weatherData
        else {
          return
        }
      self.dateLabel.text =
        self.dateFormatter.string(from: weatherData.date)
      self.currentIcon.image = UIImage(named: weatherData.iconName)
      let temp = self.tempFormatter.string(
        from: weatherData.currentTemp as NSNumber) ?? ""
      self.currentSummaryLabel.text =
        "\(weatherData.description) - \(temp)℉"
      self.forecastSummary.text = "\nSummary: \(weatherData.description)"
    }
  }
  */
  
}
