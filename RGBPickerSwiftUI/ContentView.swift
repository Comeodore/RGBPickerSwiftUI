//
//  ContentView.swift
//  RGBPickerSwiftUI
//
//  Created by Vladimir Maksymchuk on 08.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue: Double = Double.random(in: 0...255)
    @State private var greenSliderValue: Double = Double.random(in: 0...255)
    @State private var blueSliderValue: Double = Double.random(in: 0...255)
    
    @FocusState private var isKeyboardActive: Bool
    
    var body: some View {
        ZStack {
            VStack (spacing: 50) {
                ColorRectangleView(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                
                VStack {
                    SliderView(sliderValue: $redSliderValue, sliderColor: .red)
                    SliderView(sliderValue: $greenSliderValue, sliderColor: .green)
                    SliderView(sliderValue: $blueSliderValue, sliderColor: .blue)
                }
                
                Spacer()
            }
            .padding()
            .focused($isKeyboardActive)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        NotificationCenter.default.post(name: NSNotification.Name("DoneButtonTapped"), object: nil)
                        isKeyboardActive = false
                    }
                }
            }
        }
        .background(Color(UIColor(red: 0.00, green: 0.38, blue: 0.73, alpha: 1)).ignoresSafeArea())
        .onTapGesture {
            NotificationCenter.default.post(name: NSNotification.Name("KeyboardDismissed"), object: nil)
            isKeyboardActive = false
        }
    }
}

#Preview {
    ContentView()
}
