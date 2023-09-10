# 🎨 CustomColorPicker for *SwiftUI*

This is a custom color picker I made for my other app, ConsciousCart. It takes, at minimum, a title, the colors from which to pick, and a state variable holding a Color. There are some additional options you can specify such as the highlight color, the size of the color swatches, and also pass in a custom Shape to use as the color swatch.

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

The selected color is determined by matching the color's hash value, so you can have multiple color pickers bound to a single state variable that all change their selected value at the same time, given that they have the same color(s) in them.

## Screenshot:

![Example](https://github.com/achi113s/CustomColorPicker/blob/main/ReadmeResources/screenshot1.png)