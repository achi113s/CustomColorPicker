//
//  ContentView.swift
//  CustomColorPicker
//
//  Created by Giorgio Latour on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    
    var body: some View {
        VStack(spacing: 50) {
            CustomColorPicker(title: "Pick a Color",
                              colors: [.red, .blue, .green],
                              selectedColor: $selectedColor,
                              colorShapeSize: CGSize(width: 20, height: 20),
                              colorShape: {
                // You can pass any Shape here.
                // If you don't specify a closure which returns a Shape,
                // you get a Circle by default.
//                Circle()
                Rectangle()
            })
            // This is where you would add an effect for the color change.
            // For example, change the app's default accent color.
            .onChange(of: selectedColor) { newColor in
                print(newColor.description)
            }
            
            VStack {
                Text("Selected Color")
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(selectedColor)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
