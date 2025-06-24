# NYTGames-SwiftUI-Clone
This git repo supports a series of blog posts in which I am imitating the NYT Games interface using SwiftUI.
Those posts, on my website [DC-Engineer.com](DC-Engineer.com), will cover the steps in detail, while here I will host the source code and snapshots.

## Post 1: Creating the Header
The very first post on this project highlights the creation of the app project, adding custom icons and fonts, and creating the header at the top of the app screen.
Read more [on the blog](https://www.dc-engineer.com/imitating-nyt-games-with-swiftui-part-1-the-header/).

![Completed Games Header](Tutorial/gamesHeader.jpg)

## Post 2: Game Tiles
The second post covers the creation of tiles, which are the large buttons on the main page that links to the individual games.
A series of vertical and horizontal stacks are used to layout the tiles, then frames, padding, and backgrounds are used to give it shape.
Template tiles are finally added to the main games page.
Read more [on the blog](https://www.dc-engineer.com/imitating-nyt-games-with-swiftui-part-2-tiles/).

![Formatted Tile](Tutorial/tileFormatted.png)

## Post 3: Styling and Branding

### Measuring Dimension and Color
- Photos app can be used to measure dimension and color
- Tap the "edit" icon (three horizontal bars with dots on the bottom) and then the "markup" icon (pen tip at the top
- Scroll to the right to see the ruler, which won't modify the image, but can be positioned and rotated
- Tap the colored circle icon in the lower right once to open the color picker, then click the eye dropper icon in the upper left of the sheet
- Drag to the color you want to identify in the image, sheet will pop up again with RGBA and hex color codes, we'll use the hex

| Measure Width                       | Measure Height                        | Get Color Hex                          |
|-------------------------------------|---------------------------------------|----------------------------------------|
| ![Width](Tutorial/measureWidth.PNG) | ![Height](Tutorial/measureHeight.PNG) | ![Color](Tutorial/measureColorHex.PNG) | 

- We can see in the third example image the measured color hex for the blue used in the Crossword tile is `6E92E0`, we'll use this format as its a little easier to type than all three RGB values individually
- I repeated this measurement process with each of the colors recognizable in the tiles

| Color Name          | Color Hex |
|---------------------|-----------|
| `crosswordBlue`     | `6E92E0`  |
| `spellingbeeYellow` | `F2DB50`  |
| `spellingbeeOrange` | `F1CF48`  |
| `wordleGray`        | `D4D6DA`  |
| `wordleYellow`      | `CCB14E`  |
| `wordleGreen`       | `79A86B`  |
| `wordleGreenVar`    | `4B7C3C`  |
| `connectionsPurple` | `AFA7F3`  |
| `connectionsViolet` | `B174BF`  |
| `strandsTeal`       | `BBDDD8`  |
| `strandsYellow`     | `E9CA4F`  |
| `strandsBlue`       | `B6E3F0`  |
| `sudokoOrange`      | `EE9F38`  |
| `miniBlue`          | `9DBDF5`  |
| `miniBlueVar`       | `2E5CCD`  |
| `letterboxedRed`    | `EB7970`  |
| `letterboxedRedVar` | `CF2E3D`  |
| `tilesGreen`        | `BEE269`  |
| `tilesTeal`         | `80E68E`  |
| `tilesTealVar`      | `61A391`  |

### Creating Color Assets
- In XCode, click on the assets on the left hand panel, then the plus icon on the bottom of the assets content, select color set, and name our first `crosswordBlue`, as in the first column of the table
- Click the "Any Appearance" icon, which should make an editor available on the right (you may need to tap the icon in the upper right of the window to open the editor panel).
- In the color editor on the bottom right, select "8 bit hexadecimal" and enter the code `6E92E0`.
- Repeat with all the items in the table.

![Crossword Blue Asset](Tutorial/assetsCrosswordBlue.png)
 
- By placing these into color assets, we can access them as static variables in the Color class
- Modify the previews to reference these colors

```swift
extension GameTileView {
    
    // MARK: - Presets

    static var crossword: some View {
        GameTileView<Color>(
            title: "The Crossword",
            caption: "Subscribe to unlock daily puzzles and the archive.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .crossWordBlue,
            icon: { Color.black }
        )
    }
    
    static var spellingBee: some View {
        GameTileView<Color>(
            title: "Spelling Bee",
            caption: "Make as many words as you can with 7 letters.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .spellingbeeYellow,
            icon: { Color.spellingbeeOrange }
        )
    }
    
    static var wordle: some View {
        GameTileView<Color>(
            title: "Wordle",
            caption: "Guess your way to the correct word.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .wordleGray,
            icon: { Color.wordleGreen }
        )
    }
    
    static var connections: some View {
        GameTileView<Color>(
            title: "Connections",
            caption: "Group words that share a common thread.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .connectionsPurple,
            icon: { Color.connectionsViolet }
        )
    }
    
    static var theMini: some View {
        GameTileView<Color>(
            title: "The Mini",
            caption: "Solve the puzzle in seconds.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .miniBlue,
            icon: { Color.miniBlueVar }
        )
    }
}
```

![Tile Stack With Branding Colors](Tutorial/tileStackColor.png)

### Creating the Crossword Icon

- Create a new "feature" folder titled Crossword
- Inside that folder create a new SwiftUI view called `CrosswordIcon.swift`, as well as a second SwiftUI view called `CrosswordTile.swift`
- To better visualize our previews, we're also going to create a utility view in the Preview Content folder called `GameIconPreview.swift`
- In the latter, create the code to clip to the standard icon size and shape

```swift
struct GameIconPreview<GameIcon: View>: View {
    let icon: () -> GameIcon
    
    var body: some View {
        icon()
            .frame(width: 72, height: 72)
            .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    GameIconPreview(icon: { Color.secondary })
}
```

- In `CrosswordIcon.swift`

```swift
import SwiftUI

struct CrosswordIcon: View {
    private let tileColors: [[Color]] = [
        [.white, .white, .black],
        [.white, .black, .white],
        [.black, .white, .white]
    ]
    private let lineWidth: CGFloat = 4
    
    var body: some View {
        Grid(
            horizontalSpacing: lineWidth,
            verticalSpacing: lineWidth
        ) {
            ForEach(tileColors.indices, id: \.self) { i in
                GridRow {
                    ForEach(tileColors[i].indices, id: \.self) { j in
                        tileColors[i][j]
                    }
                }
            }
        }
        .background(.black)
        .scaledToFill()
        .padding(lineWidth)
        .overlay {
            RoundedRectangle(cornerRadius: 2 * lineWidth)
                .stroke(lineWidth: 2 * lineWidth)
        }
    }
}

#Preview {
    GameIconPreview(icon: CrosswordIcon.init)
}
```

- This will now render the preview, resembling the crossword icon

<img width="49" alt="image" src="https://github.com/user-attachments/assets/cc8baf7c-8f75-49ff-9a8c-2dc1d9b22c3b" />

- Now, in `CrosswordTile.swift`, add code similar to what we had previously placed in the `GamesTileView` extension, but referencing the icon.
- Eventually, we will add tap interactions to this view, but for now, its just a static representation, but housed in its own feature folder, separate from other features.

```swift
import SwiftUI

struct CrosswordTile: View {
    var body: some View {
        GameTileView(
            title: "The Crossword",
            caption: "Subscribe to unlock daily puzzles and the archive.",
            date: .now,
            author: "Eliott Radcliffe",
            background: .crossWordBlue,
            icon: CrosswordIcon.init
        )
    }
}

#Preview {
    CrosswordTile()
}
```

- We can delete the extension, and add to the `GamesPage` as a direct call to `CrosswordTile()`
- Result:

![Crossword with Icon](Tutorial/crosswordWithIcon.png)

### Create the Other Grid-like Icons

- Wordle, Connections, and The Mini all share similar icon styles
- In fact, we can build them all through a common function, create a new file at the top level called `GridIcon.swift`, paste the body code directly from `CrosswordIcon`

```swift
import SwiftUI

struct GridIcon: View {
    let tileColors: [[Color]]
    var lineWidth: CGFloat = 4
    
    var body: some View {
        /* body unchanged from CrosswordIcon */
    }
}
```

- Since we based this function off of `CrosswordIcon` in the first place, we can replace its entire body with `GridIcon(tileColors: tileColors)`, with the `tileColors` argument retained from the previous private variable.
- Similar to as we did with Crossword, create feature folders for Spelling Bee (to be created later), Wordle, Connections, and The Mini, each containing icon and tile SwiftUI files (i.e. `SpellingBeeIcon` and `SpellingBeeTile`, `WordleIcon` and `WordleTile`,  `ConnectionsIcon` and `ConnectionsTile`, `TheMiniIcon` and `TheMiniTile`).

<img width="272" alt="image" src="https://github.com/user-attachments/assets/979ab7f6-a867-4c57-a816-3e72bfd071f5" />

- Now, we can create all the grid-like icons, all following essentially the same format, but with different tile colors.

```swift
struct WordleIcon: View {
    private let tileColors: [[Color]] = [
        [.white, .white, .white],
        [.white, .wordleYellow, .wordleGreen],
        [.wordleGreen, .wordleGreen, .wordleGreen]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}

struct ConnectionsIcon: View {
    private let tileColors: [[Color]] = [
        [.connectionsViolet, .connectionsViolet, .white, .connectionsViolet],
        [.connectionsViolet, .connectionsViolet, .connectionsViolet, .white],
        [.connectionsViolet, .white, .connectionsViolet, .connectionsViolet],
        [.white, .connectionsViolet, .connectionsViolet, .connectionsViolet]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}

struct TheMiniIcon: View {
    private let tileColors: [[Color]] = [
        [.black, .white],
        [.white, .white]
    ]
    
    var body: some View {
        GridIcon(tileColors: tileColors)
    }
}
```

- Can configure the preview for or `GameIconPreview` to display each of these
```swift
#Preview {
    HStack {
        GameIconPreview(icon: CrosswordIcon.init)
        GameIconPreview(icon: ConnectionsIcon.init)
        GameIconPreview(icon: WordleIcon.init)
        GameIconPreview(icon: TheMiniIcon.init)
    }
}
```

<img width="168" alt="image" src="https://github.com/user-attachments/assets/545c4a9f-742f-40b0-940d-daf2c4dd35ed" />

- Very close, but now we have extra black boundaries between the violet squares in the Connections icon

### Customize the Connections Icon

```swift
struct ConnectionsIcon: View {
    private let lineWidth: CGFloat = 4
    
    var body: some View {
        VStack(spacing: lineWidth) {
            tileRow(whiteTileIndex: 2)
            tileRow(whiteTileIndex: 3)
            tileRow(whiteTileIndex: 1)
            tileRow(whiteTileIndex: 0)
        }
        .background(.black)
        .padding(.horizontal, 0.5 * lineWidth)
        .padding(.vertical, lineWidth)
        .clipShape(.rect(cornerRadius: 2 * lineWidth))
        .overlay {
            RoundedRectangle(cornerRadius: 2 * lineWidth)
                .stroke(lineWidth: 2 * lineWidth)
        }
    }
    
    func tileRow(whiteTileIndex: Int) -> some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .stroke(.black, lineWidth: lineWidth)
                    .fill(.connectionsViolet)
                whiteTile(at: whiteTileIndex, in: geometry)
            }
        }
    }
    
    func whiteTile(at index: Int, in geometry: GeometryProxy) -> some View {
        Rectangle()
            .stroke(.black, lineWidth: 2 * lineWidth)
            .fill(.white)
            .frame(width: geometry.size.width / 4.75)
            .offset(x: 0.25 * (Double(index) - 1.5) * geometry.size.width)
    }
}
```

### Create the Spelling Bee Icon

```swift
struct SpellingBeeIcon: View {
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                beeWings
                beeBody
                beeTail
                beeStripes
                beeFace(in: geometry)
            }
            .task {
                computeProperties(in: geometry)
            }
        }
    }

    /* other functions and variables to make up the ZStack content */
}
```

```swift
var beeBody: some View {
    Capsule()
        .stroke(.black, lineWidth: 2 * lineWidth)
        .fill(.spellingbeeOrange)
        .frame(width: bodyWidth, height: bodyHeight)
        .offset(x: bodyOffsetX, y: bodyOffsetY)
}
```

```swift
var beeTail: some View {
    Path { path in
        path.move(to: .init(x: 0, y: bodyCenterY))
        path.addLine(to: .init(x: bodyLeftX, y: bodyCenterY))
    }
    .stroke(.black, lineWidth: lineWidth)
}
```

```swift   
var beeStripes: some View {
    Path { path in
        path.move(to: .init(x: bodyCenterX, y: bodyBottomY))
        path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
        path.move(to: .init(x: bodyCenterX - offset, y: bodyBottomY))
        path.addLine(to: .init(x: bodyCenterX - offset, y: bodyTopY))
    }
    .stroke(.black, lineWidth: lineWidth)
}
```

```swift    
@ViewBuilder
var beeWings: some View {
    Path { path in
        path.move(to: .init(x: bodyCenterX, y: bodyTopY))
        path.addLine(to: .init(x: bodyCenterX, y: bodyTopY - offset))
        path.addArc(
            center: .init(x: bodyCenterX - offset, y: bodyTopY - offset),
            radius: offset,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: true
        )
        path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
    }
    .stroke(.black, lineWidth: 2*lineWidth)
    .fill(.white)
    
    Path { path in
        path.move(to: .init(x: bodyCenterX, y: bodyTopY))
        path.addLine(to: .init(x: bodyCenterX, y: bodyTopY - offset))
        path.addArc(
            center: .init(x: bodyCenterX + offset, y: bodyTopY - offset),
            radius: offset,
            startAngle: .degrees(180),
            endAngle: .degrees(90),
            clockwise: false
        )
        path.addLine(to: .init(x: bodyCenterX, y: bodyTopY))
    }
    .stroke(.black, lineWidth: 2*lineWidth)
    .fill(.white)
}
```

```swift
@ViewBuilder
func beeFace(in geometry: GeometryProxy) -> some View {
    let eyeX = offset + bodyOffsetX
    let eyeY = 0.5 * offset
    let eyeSize = 0.089 * geometry.size.width
    
    Circle()
        .fill(.black)
        .offset(x: eyeX, y: eyeY)
        .frame(width: eyeSize, height: eyeSize)
        
    let smileX = bodyWidth + bodyOffsetX
    let smileY = 0.67 * geometry.size.height

    Path { path in
        path.addArc(
            center: .init(x: smileX, y: smileY),
            radius: offset,
            startAngle: .degrees(70),
            endAngle: .degrees(140),
            clockwise: false)
    }
    .stroke(.black, lineWidth: lineWidth)
}
```

```swift
// MARK: - Shared Dimensions

@State private var bodyWidth = 0.0
@State private var bodyHeight = 0.0
@State private var bodyOffsetX = 0.0
@State private var bodyOffsetY = 0.0
@State private var bodyLeftX = 0.0
@State private var bodyCenterX = 0.0
@State private var bodyCenterY = 0.0
@State private var bodyTopY = 0.0
@State private var bodyBottomY = 0.0
@State private var offset = 0.0

private func computeProperties(in geometry: GeometryProxy) {
    bodyWidth = 0.8 * geometry.size.width
    bodyHeight = 0.5 * geometry.size.height
    bodyOffsetX = 0.05 * geometry.size.width
    bodyOffsetY = 0.15 * geometry.size.height
    bodyLeftX = 0.5 * (geometry.size.width - bodyWidth) + bodyOffsetX
    bodyCenterX = 0.5 * geometry.size.width
    bodyCenterY = 0.5 * geometry.size.height + bodyOffsetY
    bodyTopY = 0.5 * (geometry.size.height - bodyHeight) + bodyOffsetY
    bodyBottomY = 0.5 * (geometry.size.height + bodyHeight) + bodyOffsetY
    offset = 0.15 * geometry.size.height
}
```

### Results

![Group of Five Icons](Tutorial/fiveIconPreview.png)

![Updated Tile Stack](Tutorial/tileStackWithColorAndIcons.PNG)

