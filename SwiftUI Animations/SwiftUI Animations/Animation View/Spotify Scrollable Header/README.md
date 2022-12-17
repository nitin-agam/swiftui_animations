# Spotify Scrollable Header


<p align="left">
    <video alt="Animation Video" src="https://user-images.githubusercontent.com/12906999/208255130-eb6e36f4-c519-4e18-9caf-435cebcfeb84.mp4"> </p>






Before diving into code directly, I would recommended to see this page to brush the concepts used in this animation. 

*Note: Highly recommended for beginners in SwiftUI.* 

## Learning Stack:

### GeometryReader

GeometryReader is a container view in SwiftUI similar to VStack, ZStack, Group etc, that provides the dimensions of its parent view to its child views. It allows you to create layouts that depend on the size of their parent view or the size of the screen.

```swift
GeometryReader { proxy in
    ScrollView(.horizontal) {
        HStack {
            ForEach(0..<10) { index in
                Text("Item \(index)")
                    .frame(width: proxy.size.width / 2, height: 50)
                    .background(.yellow)
            }
        }
    }
}
```
Here, `GeometryProxy` contains information about the size, safe area and position of the parent view.

This will create a horizontal scrolling view with 10 items, each taking up half the width of the screen. The height of the items is fixed at 50 points.

To read the frame, `GeometryProxy` provides a `frame(in:)` method which need a `coordinateSpace`. There are three types of coordinate spaces in SwiftUI like below:

1. **Local**: The local coordinate space is specific to each view and is based on the view's position and size within its parent view.
2. **Global**: The global coordinate space is based on the position and size of the view within the screen.
3. **Custom**: You can create your own custom coordinate spaces by creating a CoordinateSpace protocol and implementing the required methods.

**Example:**

```swift
GeometryReader { proxy in
    ZStack {
        Color.yellow
            .coordinateSpace(name: "yellowView")
            .cornerRadius(10)
        
        Color.mint
            .frame(height: proxy.frame(in: .named("yellowView")).height * 1/2)
            .cornerRadius(10)
            .padding()
    }
    .padding()
}
```
In above, the height of the mint view is calculated as half of the coordinate space `yellowView`.

<br>

### @Environment(\.dismiss) var dismiss

It is an action that use to dismiss the current presentation. The `dismiss` is a property of the Environment object in SwiftUI.

Need to call the instance to perform the dismissal. You call the instance directly because it defines a callAsFunction() method that Swift calls when you call the instance.

Note that `dismiss` is only available when presenting a modal or sheet using the sheet or presentation modifiers. It is not available when presenting a view using a navigation stack.

Before iOS 15 version, we use presentationMode variable for dismissal like:

```swift
@Environment(\.presentationMode) var presentationMode
```


<br>

### zIndex(_:)

This is an instance method or modifier which is used to control the displaying order of overlapping views.

When you have multiple views that overlap each other, the view with a higher zIndex value will be displayed on top of the views with lower zIndex values.

Note that zIndex only affects the stacking order of views within the same container. If you want to change the stacking order of views that are not in the same container, you can use the zIndex modifier in conjunction with the ZStack container.

Default value is 0.

**Example:**

```swift
ZStack {
    Rectangle()
        .fill(Color.red)
        .frame(width: 120, height: 120)
        .zIndex(1)

    Rectangle()
        .fill(Color.blue)
        .frame(width: 100, height: 100)
        .zIndex(2)
}
```

In this example, the blue rectangle will be displayed on top of the red rectangle because it has a higher zIndex value.


<br>

### @ViewBuilder

In SwiftUI, `@ViewBuilder` is a attribute that you can use to annotate a function or closure that returns a view. When you use @ViewBuilder, it allows you to build the view by writing the view's structure and layout directly in the body of the function or closure, rather than returning it from the function or closure.

**Example:**

```swift
@ViewBuilder
var loginButton: some View {
    VStack {
        Text("By clicking login, you agreed on our T&c.")
        Button(action: {
            print("Login tapped")
        }) {
            Text("Login")
        }
    }
}
```

<br>

### Now you can starting learning this animation.

<br>

#### *Happy Coding 💻*

