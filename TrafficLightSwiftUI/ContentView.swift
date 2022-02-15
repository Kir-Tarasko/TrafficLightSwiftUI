//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Кирилл Тараско on 15.02.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    
    @State private var title = "Start"
    @State private var redLight = 0.4
    @State private var yellowLight = 0.4
    @State private var greenLight = 0.4
    
    @State private var currentLight = CurrentLight.red
    
    func changeColor() {
        
        let lightIsOn = 1
        let lightIsOff = 0.4
        
        switch currentLight {
        case .red:
            greenLight = lightIsOff
            redLight = Double(lightIsOn)
            currentLight = .yellow
        case .yellow:
            redLight = lightIsOff
            yellowLight = Double(lightIsOn)
            currentLight = .green
        case .green:
            greenLight = Double(lightIsOn)
            yellowLight = lightIsOff
            currentLight = .red
        }
        
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            VStack(spacing: 20) {
                ColorCircle(color: .red, opacity: redLight)
                ColorCircle(color: .yellow, opacity: yellowLight)
                ColorCircle(color: .green, opacity: greenLight)
                Spacer()
                ChangeColorButton(title: title) {
                    if title == "Start" {
                        title = "Next"
                    }
                    changeColor()
                }
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


