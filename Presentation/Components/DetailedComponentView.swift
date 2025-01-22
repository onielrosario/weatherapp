import SwiftUI

struct DetailedComponentView: View {
    @State var humidity: Int
    @State var uv: Double
    @State var feelsLike: Double
    
    private let fontName = "Poppins-Medium"
    
    var body: some View {
        ZStack {
            Color.cardPrimaryBackground
            HStack(spacing: 56) {
                VStack {
                    Text("Humidity")
                        .font(.custom(fontName, size: 12))
                        .foregroundStyle(Color.textPrimary)
                    Text("\(humidity)" + "%")
                        .font(.custom(fontName, size: 15))
                        .foregroundStyle(Color.textSecondary)
                }
                VStack {
                    Text("UV")
                        .font(.custom(fontName, size: 12))
                        .foregroundStyle(Color.textPrimary)
                    Text("\(Int(uv))")
                        .font(.custom(fontName, size: 15))
                        .foregroundStyle(Color.textSecondary)
                }
                VStack {
                    Text("Feels Like")
                        .font(.custom(fontName, size: 8))
                        .foregroundStyle(Color.textPrimary)
                    Text("\(Int(feelsLike))°")
                        .font(.custom(fontName, size: 15))
                        .foregroundStyle(Color.textSecondary)
                }
            }
        }
        .frame(width: 274, height: 75)
        .cornerRadius(16)
    }
}

#Preview {
    DetailedComponentView(humidity: 30, uv: 4.0, feelsLike: 28.0)
}
