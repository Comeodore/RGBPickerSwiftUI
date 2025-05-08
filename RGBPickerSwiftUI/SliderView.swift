//
//  SliderView.swift
//  RGBPickerSwiftUI
//
//  Created by Vladimir Maksymchuk on 08.05.2025.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    let sliderColor: Color
    
    @State var textFieldValue: String = ""
    @State var isPresented = false
    
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
                .animation(.default)
                .onAppear(perform: setDefaultValue)
                .onChange(of: sliderValue, setDefaultValue)
            
            TextField("", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.numberPad)
                .onSubmit(setValue)
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("DoneButtonTapped"))) { _ in
                    setValue()
                }
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("KeyboardDismissed"))) { _ in
                    setValue()
                }
                .alert(
                    "Wrong format of value, must be from 0 to 255",
                    isPresented: $isPresented,
                    actions: {}
                )
        }
    }
    
    private func setDefaultValue() {
        textFieldValue = formattedSliderValue
    }
    
    private func setValue() {
        if let value = Double(textFieldValue), value >= 0 && value <= 255 {
            sliderValue = value
            textFieldValue = formattedSliderValue
        } else {
            isPresented = true
            textFieldValue = formattedSliderValue
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(123), sliderColor: .red)
}
