//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Roman on 20.12.23.
//

import SwiftUI

struct RootView: View {
    @StateObject private var userSettings = UserSettings()
    
    
    var body: some View {
        Group {
            if userSettings.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userSettings) // Предоставляет общий доступ во всех дочерних view
    }
}

#Preview {
    RootView()
}
