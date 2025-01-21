import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    private let fontName = "Poppins-Medium"
    
    var body: some View {
        VStack {
            SearchView(searchQuery: viewModel.searchQuery) { searchText in
                viewModel.getWeather(for: searchText, isLocal: false)
            }
            .padding(.bottom, viewModel.weatherInfo == nil ? 240 : 40)
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
            else {
                
                if let weatherInfo = viewModel.weatherInfo {
                    if viewModel.isSavedLocally {
                        AsyncImage(url: URL(string: weatherInfo.conditionIconURL))
                            .fixedSize()
                            .frame(width: 113, height: 113)
                        HStack(alignment: .center) {
                            Text(weatherInfo.cityName)
                                .font(.custom(fontName, size: 30))
                            Image(.vector)
                                .resizable()
                                .frame(width: 21, height: 21)
                        }
                        DetailedComponent(humidity: weatherInfo.humidity,
                                          uv: weatherInfo.uvIndex,
                                          feelsLike: weatherInfo.feelsLike)
                    }
                    else {
                        CityCardView(cityName: weatherInfo.cityName,
                                     temperature: Int(weatherInfo.temperature))
                        .onTapGesture {
                            viewModel.saveCurrentCity()
                        }
                    }
                }
                else {
                    Text(viewModel.emptyResultMessage)
                        .font(.custom(fontName, size: 30))
                    Text(viewModel.emptyCTAMessage)
                        .font(.custom(fontName, size: 15))
                }
            }
            Spacer()
        }
    }
}
