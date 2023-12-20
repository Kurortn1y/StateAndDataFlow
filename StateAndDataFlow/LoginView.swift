//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Roman on 20.12.23.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(name.count >= 3 ? .green : .red)
                    .padding(.trailing, 70)
                Spacer()
            }
            Button(action: login ) {
                Label("Ok", systemImage: "checkmark.circle")
                    .disabled(name.count <= 2)
            }
        }
    }
}

extension LoginView {
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
}






