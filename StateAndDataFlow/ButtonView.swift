//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Roman on 19.12.23.
//

import SwiftUI

struct ButtonView: View {
    
     var buttonColor: Color
     var action: (() -> Void)? = nil
     var buttonTitle: String?
    
    
    @ObservedObject  var timer: TimerCounter
    
    // ObservedObject позволяет передавать данные с родительского напрямую в дочерние

    
    /*
     Binding определяют зависимостью от State переменных , по факту это ссылка на стейт
     Не требует инициализаии!!!Они Берут откуда то сверху данные !
     Используется в том случае если свйоство должно менятся при взаимодействии с UI и при этом
     изменение значения необходимо передавать в родительское представление
     */
    
    var body: some View {
        Button(action: {
            if let action = action {
                action()
            } else {
                timer.startTimer()
            }
        }) {
            Text(buttonTitle ?? timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
            .stroke(Color.black, lineWidth: 4)
            )
    }
}


#Preview {
    ButtonView(buttonColor: .red, timer: TimerCounter())
}
