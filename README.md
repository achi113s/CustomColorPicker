# 🎨 CustomColorPicker for *SwiftUI*

This is a custom color picker I made for my other app, ConsciousCart. It takes, at minimum, a state variable holding a Color. There are some additional options you can specify using the included modifiers. These include the title, the highlight color, the size of the color swatches, and the colors. You can also pass in a custom Shape to use as the color swatch as a trailing closure to the initializer.

## How to Use:

```swift
// Here's the default implementation.
@State private var selectedColor: Color = .red

CustomColorPicker(selectedColor: $selectedColor)

// And a customized one.
CustomColorPicker("Will Change this Title", selectedColor: $selectedColor, colorShape: {
                  // You can pass any Shape here.
                  // If you don't specify a closure which returns a Shape,
                  // you get a Circle by default.
                  RoundedRectangle(cornerRadius: 2)
                })
                // There are a few available view modifiers.
                .highlightColor(.blue)
                .colorShapeSize(CGSize(width: 20, height: 20))
                .colors([.yellow, .orange, .brown, .red])
                .title("🎨 Pick a Color")
```

The selected color is determined by matching the color's hash value. Unfortunately this means that the selected color does not persist between app launches, because hash values don't persist. To achieve this functionality you will need to modify the color picker to use a different identifier, e.g. a string Color name.

## Screenshot:

![Example](https://github.com/achi113s/CustomColorPicker/blob/main/ReadmeResources/screenshot1.png)