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
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.00, green: 0.38, blue: 0.73, alpha: 1))
                .ignoresSafeArea()
            
            VStack (spacing: 50) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 150)
                    .foregroundStyle(
                        Color(
                            UIColor(
                                red: redSliderValue / 255,
                                green: greenSliderValue / 255,
                                blue: blueSliderValue / 255,
                                alpha: 1
                            )
                        )
                    )
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 5))
                
                VStack {
                    SliderView(sliderValue: $redSliderValue, sliderColor: .red)
                    SliderView(sliderValue: $greenSliderValue, sliderColor: .green)
                    SliderView(sliderValue: $blueSliderValue, sliderColor: .blue)
                }
                
                Spacer()
            }
            .padding()
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Spacer()
//                    Button("Done") {
//                        setValue()
//                    }
//                }
//            }
        }
    }
}


struct SliderView: View {
    @Binding var sliderValue: Double
    @State var textFieldValue: String = ""
    
    let sliderColor: Color
    
    var formattedSliderValue: String {
        lround(sliderValue).formatted()
    }
    
    var body: some View {
        HStack {
            Text(formattedSliderValue)
                .frame(width: 40)
                .foregroundColor(.white)
            Slider(value: $sliderValue, in: 0...255)
                .tint(sliderColor)
            TextField("", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
        }
    }
    
    func setValue() {
        if let value = Double(textFieldValue) {
            sliderValue = value
        }
    }
}

#Preview {
    ContentView()
}
