//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Roman on 19.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimerCounter()
    @EnvironmentObject private var user: UserSettings
        // EnvironmetntObj создает источник данных которые доступны из любого представления
        
    
    
    
    //  для создания и владения экземпляром класса который подписан под протокол ObservableObject
    
    /*State должно использоваться когда меняем элемент интерфейса
     Должно быть единственным источником для связаного с ним представления
     Первоисточник!!
     ВСЕГДА ИНИЦИАЛИЗАЦИЯ И ПРИВАТ!
     */
    
    var body: some View {
        VStack {
            Text("Yo, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()

            ButtonView(buttonColor: .red, timer: timer)
            Spacer()
            ButtonView(buttonColor: .blue,
                       action: logOut,
                       buttonTitle: "LogOut",
                       timer: timer
            )

        }
        .padding()
    }
}

extension ContentView {
    private func logOut() {
        user.isLoggedIn = false
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings())
}

