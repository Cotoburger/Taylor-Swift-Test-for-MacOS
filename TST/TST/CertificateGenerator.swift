import PDFKit
import AppKit

struct CertificateGenerator {
    static func generate(score: Int) {
        let pdfDocument = PDFDocument()
        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842) // A4
        
        // Создаем PDF страницу с текстом
        let image = NSImage(size: pageRect.size)
        image.lockFocus()
        
        // Белый фон
        NSColor.white.setFill()
        pageRect.fill()
        
        // Текст
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: NSFont.systemFont(ofSize: 24),
            .paragraphStyle: paragraphStyle
        ]
        
        let text = """
        Сертификат Swiftie

        Вы прошли тест по Тейлор Свифт!

        Результат: \(score) баллов
        """
        
        // Рисуем текст в середине страницы
        let textRect = CGRect(x: 50, y: pageRect.height/2 - 100, width: pageRect.width - 100, height: 200)
        text.draw(in: textRect, withAttributes: attributes)
        
        image.unlockFocus()
        
        if let page = PDFPage(image: image) {
            pdfDocument.insert(page, at: 0)
        }
        
        // NSSavePanel для сохранения
        let panel = NSSavePanel()
        panel.nameFieldStringValue = "SwiftieCertificate.pdf"
        panel.allowedContentTypes = [.pdf]
        
        panel.begin { response in
            if response == .OK, let url = panel.url {
                if pdfDocument.write(to: url) {
                    print("Сертификат сохранён: \(url.path)")
                } else {
                    print("Ошибка при сохранении сертификата")
                }
            }
        }
    }
}
