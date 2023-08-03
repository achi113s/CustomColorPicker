# CustomColorPicker for *SwiftUI*

This is a custom color picker I made for my other app, ConsciousCart. It takes, at minimum, a title, the colors from which to pick, and a state variable holding a binding. There are some additional options you can specify such as the highlight color, the size of the color swatches, and also pass in a Shape to use as the color swatch.

## How to Use:

```swift
// Here's the default implementation.
@State private var selectedColor: Color = .red

CustomColorPicker("Pick a Color", selectedColor: $selectedColor)

// And a customized form.
CustomColorPicker("🎨 Pick a Color",
                                  colors: [.yellow, .orange, .brown, .red],
                                  selectedColor: $selectedColor,
                                  highlightColor: Color.blue,
                                  colorShapeSize: CGSize(width: 20, height: 20),
                                  colorShape: {
                    // You can pass any Shape here.
                    // If you don't specify a closure which returns a Shape,
                    // you get a Circle by default.
                    RoundedRectangle(cornerRadius: 2)
                })
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
```

The selected color is determined by matching the color's hash value, so you can have multiple color pickers bound to a single state variable that all change their selected value at the same time, given that they have the same color(s) in them.

## Screenshot:

![Example](https://github.com/achi113s/CustomColorPicker/blob/main/ReadmeResources/screenshot1.png)