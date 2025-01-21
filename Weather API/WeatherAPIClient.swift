import Foundation

enum WeatherAPIError: Error {
    case badServer, invalidCity
}

struct WeatherAPIClient {
    let apiKey: String
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func fetchCurrentWeather(for city: String) async throws -> WeatherResponseDTO {
        let path = "/current.json"
        let urlString = "\(baseURL)\(path)?key=\(apiKey)&q=\(city)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200:
                break
            case 400:
                throw WeatherAPIError.invalidCity
            default:
                throw WeatherAPIError.badServer
            }
        }
        
        let decoder = JSONDecoder()
        let weatherDTO = try decoder.decode(WeatherResponseDTO.self, from: data)
        return weatherDTO
    }
}
