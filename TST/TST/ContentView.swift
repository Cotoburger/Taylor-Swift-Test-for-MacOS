import SwiftUI

// Вью для эффекта размытости
struct VisualEffectBlur: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    var state: NSVisualEffectView.State = .active
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        view.blendingMode = blendingMode
        view.state = state
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
        nsView.blendingMode = blendingMode
        nsView.state = state
    }
}

// MARK: - ContentView с балльной системой
struct ContentView: View {
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var showResult = false
    @State private var showWelcome = true
    
    var body: some View {
        ZStack {
            // Полупрозрачный системный фон
            VisualEffectBlur(material: .sidebar, blendingMode: .behindWindow)
                .ignoresSafeArea()
            
            if showWelcome {
                // Экран приветствия
                VStack(spacing: 30) {
                    Text("Welcome to the Most Advanced Taylor Swift Test Ever Created for MacOS")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: { showWelcome = false }) {
                        Text("Start")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)
                }
            } else if showResult {
                ResultView(points: score)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                // Экран теста
                let question = quiz[currentQuestion]
                
                VStack(spacing: 20) {
                    Text(question.text)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40)
                        .padding(.horizontal, 20)
                        .frame(minHeight: 120) // фиксируем минимальную высоту
                    
                    ForEach(0..<question.options.count, id: \.self) { i in
                        Button(action: {
                            // Добавляем баллы за выбранный вариант
                            score += question.points[i]
                            nextQuestion()
                        }) {
                            Text(question.options[i])
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.15))
                                .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    func nextQuestion() {
        if currentQuestion + 1 < quiz.count {
            currentQuestion += 1
        } else {
            showResult = true
        }
    }
}
