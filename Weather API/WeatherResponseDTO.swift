struct WeatherResponseDTO: Codable {
    let location: Location
    let current: Current
    
    struct Location: Codable {
        let name: String
        let region: String
        let country: String
    }
    
    struct Current: Codable {
        let temp_c: Double
        let condition: Condition
        let humidity: Int
        let uv: Double
        let feelslike_c: Double
        
        struct Condition: Codable {
            let text: String
            let icon: String
        }
    }
}
