# Sweet SF Symbols

[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols) are a set of over 2,500 consistent, highly configurable symbols you can use in your app. SF Symbols are designed to integrate seamlessly with the San Francisco system font, so the symbols automatically ensure optical vertical alignment with text for all weights and sizes.

## Highlights

- :fire: Built with [Expo's Module API](https://docs.expo.dev/modules/module-api/)
- :art: Support for all [rendering modes](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#rendering-modes)
- :loud_sound: Support for [variable color values](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#variable-color)
- :apple: iOS only ([see why](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#custom-symbols))

## Installation

Sweet SFSymbols likely requires Expo SDK 46+.

### Expo

Install the library:

```console
npx expo install sweet-sfsymbols
```

Then rebuild your app. If you are using EAS, simply run a build. If not, you'll need to rebuild your dev client.

```console
npx expo prebuild -p ios --clean
npx expo run:ios
```

> **_NOTE:_** This library will not work with Expo Go.

## Usage

```tsx
import { useState } from "react";
import { View, Button } from "react-native";
import { SFSymbol } from "react-native-sfsymbol";

export default function App() {
  const [volume, setVolume] = useState(0);
  return (
    <View style={styles.container}>
      {/* Monochrome rendering mode (one color) */}
      <SFSymbol
        name="heart"
        color="#FF3B30FF"
        weight="bold"
        size={100}
        scale="small"
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
    </View>
  );
}
```

## `<SFSymbol />`

The `SFSymbol` component uses UIKit's `UIImage` view to render SF Symbols.

### `Props`

#### `name`

The name of the symbol.

> required: yes
>
> type: [`SystemName`](https://github.com/andrew-levy/react-native-sfsymbol/blob/main/src/SFSymbol.types.ts#L23)
>
> default: `""`

#### `color`

The color of the symbol. This can be a single color or an array of colors depending on the rendering mode.

> required: no
>
> type: `string` or `string[]`
>
> default: `"#007AFFFF"`

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
> default: `"small"`

#### `renderingMode`

The rendering mode of the symbol.

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
> default: `42`

#### `variableValue`

The variable value of the symbol.

> required: no
>
> type: `number`
>
> default: `1.0`

#### `style`

The style of the symbol.

> required: no
>
> type: `StyleProp<ViewStyle>`
>
> default: `undefined`
