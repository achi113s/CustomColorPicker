//
//  CustomColorPicker.swift
//  CustomColorPicker
//
//  Created by Giorgio Latour on 8/2/23.
//

import SwiftUI

/// Custom Color Picker title, colors, selectedColor, highlightColor, colorShapesize, colorShape
/// - Parameter title: Optional. The title for the color picker. Default is "Color Picker".
/// - Parameter selectedColor: Required. A binding to a Color view.
/// - Parameter highlightColor: Optional. The Color to make the selection indicator. Default is the primary app color.
/// - Parameter colorShapeSize: Optional. A CGSize object describing the desired size of the color swatches. Default is 20 by 20.
/// - Parameter colorShape: Optional. A closure which returns a Shape. Use this to use a different shape for the color swatches, e.g. a rectangle. The selection indicator will be a scaled up version of the shape you specify.
/// - Returns View: The color picker view.
struct CustomColorPicker<ColorShape: Shape>: View {
    private var title: String
    private var colorShapeSize: CGSize = CGSize(width: 20, height: 20)
    private var colorShape: ColorShape
    private var highlightColor: Color = Color.primary
    
    @State private var colors: [Color] = [Color.red, Color.blue, Color.green]
    @Binding private var selectedColor: Color
    
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
    
    public init(_ title: String = "Color Picker",
         selectedColor: Binding<Color>,
         colorShape: @escaping () -> ColorShape = { Circle() }
    ) {
        self.title = title
        self._selectedColor = selectedColor
        self.colorShape = colorShape()
    }
    
    /// Changes the color picker's title.
    /// - Parameter newTitle: String
    public func title(_ newTitle: String) -> CustomColorPicker {
        var view = self
        view.title = newTitle
        return view
    }
    
    /// Changes the selectable colors.
    /// - Parameter colors: An array of Colors to present to the user.
    public func colors(_ colors: [Color]) -> CustomColorPicker {
        var view = self
        view._colors = State(initialValue: colors)
        return view
    }
    
    /// Changes the size of the color swatches.
    /// - Parameter size: CGSize object indicating desired size.
    public func colorShapeSize(_ size: CGSize) -> CustomColorPicker {
        var view = self
        view.colorShapeSize = size
        return view
    }
    
    /// Changes the color of the selected color highlight.
    /// - Parameter color: A Color.
    public func highlightColor(_ color: Color) -> CustomColorPicker {
        var view = self
        view.highlightColor = color
        return view
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static let title = "🎨  Accent Color"
    static let colors: [Color] = [.red, .blue, .green]
    static let defaultSelectedColor: Color = .red
    
    static var previews: some View {
        StatefulPreviewWrapper(Color.red) {
            CustomColorPicker(title,
                              selectedColor: $0
            )
        }
    }
}
