import SwiftUI

@main
struct Weather_App: App {
    var body: some Scene {
        WindowGroup {
            let apiClient = WeatherAPIClient(apiKey: "YOUR_API_KEY_HERE")
            let weatherRepo = WeatherRepository(apiClient: apiClient)
            
            let homeVM = HomeViewModel(weatherRepository: weatherRepo)
            HomeView(viewModel: homeVM)
        }
    }
}
