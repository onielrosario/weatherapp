import SwiftUI

struct CityCardView: View {
    @State var cityName: String
    @State var temperature: Int
    
    private let fontName = "Poppins-Medium"

    var body: some View {
        ZStack {
            Color.cardPrimaryBackground
            HStack(spacing: 106) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(cityName)
                        .font(.custom(fontName, size: 20))
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text("\(temperature)")
                            .font(.custom(fontName, size: 60))
                        
                        // Degree symbol
                        Text("°")
                            .font(.custom(fontName, size: 20))
                            .baselineOffset(10)
                            .padding(.top, 12)
                    }
                }
                
                // Weather icon
                Image(uiImage: .cloudLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
            }
            // According to your Figma, there's 16px of top padding,
            // but no bottom/side padding specified. Adjust as desired.
            .padding(.top, 16)
        }
        // Match Figma's exact size
        .frame(width: 336, height: 117)
        .cornerRadius(16)
    }
}


#Preview {
    CityCardView(cityName: "", temperature: 0)
}
