# Styler

## Simple usage:

```
import UIKit

let regularStyle: (Styler) -> Void = {
    $0.font(UIFont.systemFont(ofSize: 13, weight: .regular))
    $0.foreground(color: .blue)
}
let semiboldStyle: (Styler) -> Void = {
    $0.font(UIFont.systemFont(ofSize: 13, weight: .semibold))
    $0.foreground(color: .yellow)
}

let regularStyleText = Styler(string: "Regular style text", styleCompletion: regularStyle)
let semiboldStyleText = Styler(string: "\nSemibold style text", styleCompletion: semiboldStyle)
regularStyleText.appendAdditionalStyle(semiboldStyleText)

// or just

let regularStyleText = Styler(string: "Regular style text") {
    $0.font(UIFont.systemFont(ofSize: 13, weight: .regular))
    $0.foreground(color: .blue)
}

let label = UILabel()
label.attributedText = regularStyleText.attributedString
```
