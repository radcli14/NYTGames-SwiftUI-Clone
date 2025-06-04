# NYTGames-SwiftUI-Clone
This git repo supports a series of blog posts in which I am imitating the NYT Games interface using SwiftUI.
Those posts, on my website [DC-Engineer.com](DC-Engineer.com), will cover the steps in detail, while here I will host the source code and snapshots.

## Post 1: Creating the Header
The very first post on this project highlights the creation of the app project, adding custom icons and fonts, and creating the header at the top of the app screen.
Read more [on the blog](https://www.dc-engineer.com/imitating-nyt-games-with-swiftui-part-1-the-header/).
![Completed Games Header](Tutorial/gamesHeader.jpg)

## Post 2: Game Tiles
Post on the blog is upcoming, stay tuned

- New -> File From Template -> SwiftUI View, name it "GameTileView"
- Start with a large tile, which include:
  * Title `Text` in the upper left, using the custom Cheltenham font
  * Caption `Text` underneath the title, in smaller secondary text
  * Icon `View` on the right
  * Date as formatted `Text` on the lower left, in a bolded sans font
  * Author name `Text` as in the lower right, as capitalized secondary text

```swift
struct GameTileView<GameIcon: View>: View {
    let title: String
    let caption: String
    let date: Date
    let author: String
    let icon: () -> GameIcon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // Will replace with our code
    }
}

#Preview {
    GameTileView(title: "", caption: "", date: Date(), author: "", icon: { Text("") })
}
```
