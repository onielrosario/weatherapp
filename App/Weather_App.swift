import SwiftUI

@main
struct Weather_App: App {
    var body: some Scene {
        WindowGroup {
            let apiClient = WeatherAPIClient(apiKey: "730954a677e64ee3841173344251501")
            let weatherRepo = WeatherRepository(apiClient: apiClient)
            
            let homeVM = HomeViewModel(weatherRepository: weatherRepo)
            HomeView(viewModel: homeVM)
        }
    }
}
