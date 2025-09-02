//
//  TSTApp.swift
//  TST
//
//  Created by Алексей Бойко on 03.09.2025.
//

import SwiftUI

@main
struct TSTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 470, minHeight: 410)
                .onAppear {
                    if let window = NSApplication.shared.windows.first {
                        window.minSize = NSSize(width: 470, height: 410)
                    }
                }
        }
    }
}
