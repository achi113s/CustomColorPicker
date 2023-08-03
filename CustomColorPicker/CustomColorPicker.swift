//
//  CustomColorPicker.swift
//  CustomColorPicker
//
//  Created by Giorgio Latour on 8/2/23.
//

import SwiftUI

/// Custom Color Picker title, colors, selectedColor, highlightColor, colorShapesize, colorShape
/// - Parameter title: Optional. The title for the color picker. Default is "Color Picker".
/// - Parameter colors: Optional. An array of Colors to present to the user. Default Colors are red, blue, and green.
/// - Parameter selectedColor: Required. A binding to a Color view.
/// - Parameter highlightColor: Optional. The Color to make the selection indicator. Default is the primary app color.
/// - Parameter colorShapeSize: Optional. A CGSize object describing the desired size of the color swatches. Default is 20 by 20.
/// - Parameter colorShape: Optional. A closure which returns a Shape. Use this to use a different shape for the color swatches, e.g. a rectangle. The selection indicator will be a scaled up version of the shape you specify.
/// - Returns View: The color picker view.
struct CustomColorPicker<ColorShape: Shape>: View {
    var title: String
    var colorShapeSize: CGSize
    var colorShape: ColorShape
    
    @State private var colors: [Color]
    @Binding private var selectedColor: Color
    var highlightColor: Color
    
    var body: some View {
        HStack {
            Text("\(title)")
            
            Spacer()
            
            ForEach(colors, id: \.hashValue) { color in
                colorShape
                    .fill(color)
                    .frame(width: colorShapeSize.width, height: colorShapeSize.height)
                    .overlay {
                        if selectedColor == color {
                            colorShape
                                .scale(1.3)
                                .stroke(style: .init(lineWidth: 2))
                                .fill(highlightColor)
                        }
                    }
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
    
    init(_ title: String = "Color Picker",
         colors: [Color] = [Color.red, Color.blue, Color.green],
         selectedColor: Binding<Color>,
         highlightColor: Color = Color.primary,
         colorShapeSize: CGSize = CGSize(width: 20, height: 20),
         colorShape: @escaping () -> ColorShape = { Circle() }
    ) {
        self.title = title
        self._colors = State(initialValue: colors)
        self._selectedColor = selectedColor
        self.highlightColor = highlightColor
        self.colorShape = colorShape()
        self.colorShapeSize = colorShapeSize
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static let title = "🎨  Accent Color"
    static let colors: [Color] = [.red, .blue, .green]
    static let defaultSelectedColor: Color = .red
    
    static var previews: some View {
        StatefulPreviewWrapper(Color.red) {
            CustomColorPicker(title,
                              colors: colors,
                              selectedColor: $0,
                              colorShapeSize: CGSize(width: 20, height: 20)
            )
        }
    }
}
