import SwiftUI

struct forecastView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                Text("24º")
                    .font(.largeTitle)
            }
            Text("Sunny outside.\nDon't forget your hat!")
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

#Preview {
    forecastView()
}
