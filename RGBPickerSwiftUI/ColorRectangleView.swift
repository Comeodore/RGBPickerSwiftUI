//
//  ColorRectangleView.swift
//  RGBPickerSwiftUI
//
//  Created by Vladimir Maksymchuk on 08.05.2025.
//

import SwiftUI

struct ColorRectangleView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(height: 150)
            .foregroundStyle(
                Color(
                    UIColor(
                        red: red / 255,
                        green: green / 255,
                        blue: blue / 255,
                        alpha: 1
                    )
                )
            )
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 5))
    }
}

#Preview {
    ColorRectangleView(red: 222, green: 111, blue: 11)
}
