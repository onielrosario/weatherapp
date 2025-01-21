import Foundation

protocol CityStorageInterface: AnyObject {
    func save(cityName: String)
    func fetchCity() -> String?
}

final class CityStorage: CityStorageInterface {
    private let defaults = UserDefaults.standard
    private let cityKey = "savedCityName"
    
    func save(cityName: String) {
        defaults.set(cityName, forKey: cityKey)
    }
    
    func fetchCity() -> String? {
        defaults.string(forKey: cityKey)
    }
}
