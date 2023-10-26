# Sweet SF Symbols

[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols) are a set of over 2,500 consistent, highly configurable symbols you can use in your app. SF Symbols are designed to integrate seamlessly with the San Francisco system font, so the symbols automatically ensure optical vertical alignment with text for all weights and sizes.

## Highlights

- :fire: Built with [Expo's Module API](https://docs.expo.dev/modules/module-api/)
- :art: Support for all [rendering modes](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#rendering-modes)
- :loud_sound: Support for [variable color values](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#variable-color)
- :loud_sound: Support for [symbol variants](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Design-variants)
- :apple: iOS only ([see why](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#custom-symbols))

## Installation (Coming Soon!)

Sweet SFSymbols likely requires Expo SDK 46+.

### Expo

Install the library:

```console
npx expo install ?????
```

Then rebuild your app. If you are using EAS Build, simply run a build using eas-cli.

```
eas build --platform ios
```

If not, you'll need to rebuild your dev client.

```console
npx expo prebuild -p ios --clean
npx expo run:ios
```

> **_NOTE:_** This library will not work with Expo Go. Use a [custom dev client](https://docs.expo.dev/develop/development-builds/create-a-build/) instead!

## Usage

```tsx
import { useState } from "react";
import { View, Button } from "react-native";
import SFSymbol from "?????";

export default function App() {
  const [volume, setVolume] = useState(0);
  return (
    <View style={styles.container}>
      {/* Monochrome rendering mode (one color) */}
      <SFSymbol
        name="heart"
        renderingMode="monochrome" // (this is the default)
        color={["#FF3B30FF"]}
        weight="bold"
        size={100}
      />
      {/* Hierarchical rendering mode (one color with opacities), with a varaible value */}
      <SFSymbol
        name="speaker.wave.3"
        renderingMode="hierarchical"
        scale="medium"
        variableValue={volume}
        size={100}
      />
      <Button title="Volume Up" onPress={() => setVolume(volume + 0.1)} />
      {/* Palette rendering mode (multiple custom colors) */}
      <SFSymbol
        name="person.2"
        renderingMode="palette"
        color={["#FF3B30FF", "#007AFFFF"]}
        size={100}
      />
      {/* Multicolor rendering mode (pre-determined system colors) */}
      <SFSymbol
        name="phone.arrow.up.right"
        renderingMode="multicolor"
        size={100}
      />
      {/* Symbol variants */}
      <SFSymbol name="person.3" variant="fill" size={100} />
    </View>
  );
}
```

## `<SFSymbol />`

The `SFSymbol` component uses SwiftUI's `Image` view to render SF Symbols.

### `Props`

#### `name`

The name of the symbol.

> required: yes
>
> type: `SystemName`
>
> default: `""`

#### `color`

The color of the symbol. For monochrome and hierarchical rendering modes, this is a single color. For palette rendering mode, this is an array of colors. For multicolor rendering mode, this is ignored and system default values are used.

> required: no
>
> type: `string[]`
>
> default: `[]`

#### `weight`

The weight of the symbol.

> required: no
>
> type: `"thin" | "ultraLight" | "light" | "regular" | "medium" | "semibold" | "bold" | "heavy" | "black"`
>
> default: `"regular"`

#### `scale`

The scale of the symbol.

> required: no
>
> type: `"small" | "medium" | "large"`
>
> default: `"medium"`

#### `renderingMode`

The rendering mode of the symbol. Learn more about rendering modes [here](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Rendering-modes).

> required: no
>
> type: `"monochrome" | "hierarchical" | "palette" | "multicolor"`
>
> default: `"monochrome"`

#### `size`

The size of the symbol. This deifines the frame of the image view.

> required: no
>
> type: `number`
>
> default: `50`

#### `variableValue`

The variable value of the symbol. Only some symbols support variable values, ususally those that represent a change in value (like `speaker.wave.3`) The variable value determines what percentage of the symbol is filled in. Learn more about variable values [here](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Variable-color).

> required: no
>
> type: `number`
>
> default: `1.0`

#### `variant`

The variant of the symbol. This is an alternate way to modify the symbol's appearance without modifying the symbol name. Learn more about symbol variants [here](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Design-variants).

> required: no
>
> type: `"none" | "circle" | "square" | "rectangle" | "fill" | "slash"` and combinations of these!
>
> default: `none`

#### `style`

The style of the symbol.

> required: no
>
> type: `StyleProp<ViewStyle>`
>
> default: `undefined`
