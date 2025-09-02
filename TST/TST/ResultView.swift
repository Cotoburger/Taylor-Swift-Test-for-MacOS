import SwiftUI

struct ResultView: View {
    let points: Int  // передаем именно баллы
    
    var body: some View {
            VStack(spacing: 20) {
                Text("Ты набрал \(points) баллов!")
                    .font(.title2)
                    .padding()
                
                Button("Скачать сертификат") {
                    CertificateGenerator.generate(score: points) // убедиться, что есть только один
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(NSColor.windowBackgroundColor))
        }
}
