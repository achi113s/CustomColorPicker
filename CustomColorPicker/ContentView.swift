//
//  ContentView.swift
//  CustomColorPicker
//
//  Created by Giorgio Latour on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    
    let noticeText: String = """
    Notice that these two color pickers are coupled to the \
    same selectedColor state variable. So when they both contain \
    a color with the same hash value, that color is selected in \
    both pickers.
    """
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Custom Color Picker")
                .font(.title)
            
            VStack(spacing: 15) {
                Text("Default Example")
                    .font(.title3)
                CustomColorPicker("Pick a Color",
                                  selectedColor: $selectedColor
                )
            }
            
            Divider()
            
            VStack(spacing: 15) {
                Text("Customized Example")
                    .font(.title3)
                Text(noticeText)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                
                CustomColorPicker("🎨 Pick a Color",
                                  colors: [.yellow, .orange, .brown, .red],
                                  selectedColor: $selectedColor,
                                  colorShape: {
                    // You can pass any Shape here.
                    // If you don't specify a closure which returns a Shape,
                    // you get a Circle by default.
                    RoundedRectangle(cornerRadius: 2)
                })
                // There are two available view modifiers.
                .highlightColor(.blue)
                .colorShapeSize(CGSize(width: 30, height: 15))
                // This is where you could perform some change based on the selected color.
                // For example, change the app's default accent color.
                .onChange(of: selectedColor) { newColor in
                    print(newColor.description)
                }
                .frame(width: 300, height: 40)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(8)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: .init(lineWidth: 1))
                        .fill(Color.init(white: 0.9))
                )
            }
            
            Divider()
            
            HStack {
                Text("Selected Color:")
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(selectedColor)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
