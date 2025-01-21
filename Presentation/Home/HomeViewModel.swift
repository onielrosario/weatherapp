import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var weatherInfo: WeatherInfo?
    @Published var errorMessage: String?
    @Published var isSavedLocally: Bool = false
    @State var searchQuery: String = ""
    
    let emptyResultMessage = "No City Selected"
    let emptyCTAMessage = "Please Search For A City"

    private var isLoading = false
    private let weatherRepository: WeatherRepositoryInterface
    private let cityStorage: CityStorageInterface
    
    init(weatherRepository: WeatherRepositoryInterface,
         cityStorage: CityStorageInterface = CityStorage()) {
        self.weatherRepository = weatherRepository
        self.cityStorage = cityStorage
        
        if let savedCity = self.cityStorage.fetchCity() {
            isSavedLocally = true
            getWeather(for: savedCity, isLocal: true)
        }
    }
    
    private func fetchWeather(for city: String) async {
        isLoading = true
        errorMessage = nil
        
        if weatherInfo?.cityName != city {
            weatherInfo = nil
        }
        
        do {
            let info = try await weatherRepository.getWeather(for: city.lowercased())
            self.weatherInfo = info
        } catch {
            self.errorMessage = "Failed to load weather. \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func getWeather(for city: String, isLocal: Bool) {
        guard city.isEmpty == false, isLoading == false else { return }
        Task {
            isSavedLocally = isLocal
            await fetchWeather(for: city)
        }
    }
    
    func saveCurrentCity() {
        guard let cityName = weatherInfo?.cityName else { return }
        cityStorage.save(cityName: cityName)
        getWeather(for: cityName, isLocal: true)
    }
}
