# NYTGames-SwiftUI-Clone
This git repo supports a series of blog posts in which I am imitating the NYT Games interface using SwiftUI.
Those posts, on my website [DC-Engineer.com](DC-Engineer.com), will cover the steps in detail, while here I will host the source code and snapshots.

## Post 1: Creating the Header
The very first post on this project highlights the creation of the app project, adding custom icons and fonts, and creating the header at the top of the app screen.
Read more [on the blog](https://www.dc-engineer.com/imitating-nyt-games-with-swiftui-part-1-the-header/).
![Completed Games Header](Tutorial/gamesHeader.jpg)

## Post 2: Game Tiles
Post on the blog is upcoming, stay tuned

### Create the File and Placeholders

- New -> File From Template -> SwiftUI View, name it "GameTileView"
- Start with a large tile, which include:
  * Title `Text` in the upper left, using the custom Cheltenham font
  * Caption `Text` underneath the title, in smaller secondary text
  * Date as formatted `Text` on the lower left, in a bolded sans font
  * Author name `Text` as in the lower right, as capitalized secondary text
  * Background `Color`
  * Icon `View` on the right
- Create the constants at the top of the view structure, including defining the `GameIcon` as a generic view
- Also add placeholders in the preview

```swift
struct GameTileView<GameIcon: View>: View {
    let title: String
    let caption: String
    let date: Date
    let author: String
    let background: Color
    let icon: () -> GameIcon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // Will replace with our code
    }
}

#Preview {
    GameTileView(
        title: "The Crossword",
        caption: "Subscribe to unlock daily puzzles and the archive.",
        date: .now,
        author: "Eliott Radcliffe",
        background: .blue,
        icon: { Color.black }
    )
}
```

- Inside the `body` of our view, we can build up the view scaffold

```swift
VStack {
    HStack {
        VStack {
            Text(title)
            Text(caption)
        }
        icon()
    }
    HStack {
        Text(date.formatted())
        Text(author)
    }
}
.background(background)
```

- This won't look much like the actual tile just yet, but you can see the items 

![Initial Tile Structure](Tutorial/tileInitial.png)

### Add Frames, Padding, and Rounded Corners

- We want to restrict the height of the tile, and the size of the icon, add dimensions as constants at the bottom of the `GameTileView` (ballpark)

```swift
// MARK: - Constants

private let tileHeight: CGFloat = 164
private let tileCornerRadius: CGFloat = 16
private let iconSize: CGFloat = 72
private let iconCornerRadius: CGFloat = 8
```

- Below the main `VStack`, where we previously attached the `.background(background)` modifier

```swift
VStack {
    /* other view components */
}
.padding()
.frame(maxWidth: .infinity, maxHeight: tileHeight)
.background {
    RoundedRectangle(cornerRadius: tileCornerRadius).fill(background)
}
```

- Attach frame and clip modifiers to the icon

```swift
icon()
    .frame(width: iconSize, height: iconSize)
    .clipShape(.rect(cornerRadius: iconCornerRadius))
```

![Tile After Framing](Tutorial/tileFramed.png)
