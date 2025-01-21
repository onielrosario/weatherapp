import Foundation

@MainActor
protocol WeatherRepositoryInterface: AnyObject {
    func getWeather(for city: String) async throws -> WeatherInfo
}

@MainActor
class WeatherRepository: WeatherRepositoryInterface {
    
    private let apiClient: WeatherAPIClient
    private var cache: [String: WeatherInfo] = [:]
    
    init(apiClient: WeatherAPIClient) {
        self.apiClient = apiClient
    }
    
    func getWeather(for city: String) async throws -> WeatherInfo {
        if let cached = cache[city] {
            return cached
        }
        
        do {
            let newFetchedWeather = try await apiClient.fetchCurrentWeather(for: city)
            let info = WeatherInfo(
                cityName: newFetchedWeather.location.name,
                temperature: newFetchedWeather.current.temp_c,
                conditionText: newFetchedWeather.current.condition.text,
                conditionIconURL: "https:\(newFetchedWeather.current.condition.icon)",
                humidity: newFetchedWeather.current.humidity,
                uvIndex: newFetchedWeather.current.uv,
                feelsLike: newFetchedWeather.current.feelslike_c
            )
            
            cache[city] = info
            return info
        }
        catch {
            throw error
        }
    }
}
