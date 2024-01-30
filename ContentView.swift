import SwiftUI

struct ContentView: View {
    @StateObject private var weatherAPIService = WeatherAPIService()
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            if let currentWeather = weatherAPIService.currentWeather  {
                HStack(alignment: .center, spacing: 16) {
                    currentWeather.weatherCode.image
                        .font(.largeTitle)
                    Text("\(currentWeather.temperature)º")
                        .font(.largeTitle)
                }
                Text(currentWeather.weatherCode.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            HStack{
                
                    Text("Humidity")
                    Text("\(currentWeather.humidity)")
                }
                HStack{
                        Text("UV index")
                        Text("\(currentWeather.uvIndex)")
                    }
            } else {
                Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button("Refresh", action: {
                    Task {
                        await weatherAPIService.fetchWeather()
                    }
                })
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
        .onAppear {
            Task {
                await weatherAPIService.fetchWeather()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

