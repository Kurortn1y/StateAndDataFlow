//
//  UserSettings.swift
//  StateAndDataFlow
//
//  Created by Roman on 20.12.23.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var isLoggedIn = false // оболочка автоматической генерации уведомлений об изменениях свойств обьекта
    var name = ""
}
