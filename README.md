[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/hugemathguy)

# Sweet SF Symbols

[SF Symbols](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols) are a set of over 5,000 consistent, highly configurable symbols you can use in your app. SF Symbols are designed to integrate seamlessly with the San Francisco system font, so the symbols automatically ensure optical vertical alignment with text for all weights and sizes.

## Highlights

- :fire: Built with [Expo's Module API](https://docs.expo.dev/modules/module-api/)
- :art: [Rendering modes](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#rendering-modes)
- :art: [Variable color values](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#variable-color)
- :no_bell: [Symbol Variants](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Design-variants)
- :tada: [Symbol Effects](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Animations)
- :apple: iOS only ([see why](https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols#custom-symbols))

## Installation

Sweet SFSymbols requires Expo SDK 46+ and Xcode 15+.

### Expo

Install the library:

```console
npx expo install sweet-sfsymbols
```

Then rebuild your app:

```bash
# Using EAS? run a build in the cloud!
eas build --platform ios

# Otherwise, prebuild and run a local build
npx expo prebuild -p ios --clean
npx expo run:ios
```

> **_NOTE:_** This library will not work with Expo Go. Use a [development build](https://docs.expo.dev/develop/development-builds/create-a-build/) instead!

## Usage

See the [example app](/example).

## `<SFSymbol />`

The `SFSymbol` component uses SwiftUI's `Image` view to render SF Symbols.

### `Props`

#### `name`

The name of the symbol.

> required: yes
>
> type: [`SystemName`](./src/SweetSFSymbols.types.ts)
>
> default: `""`

#### `colors`

The colors of the symbol. For monochrome and hierarchical rendering modes, this is a single color. For palette rendering mode, this is an array of colors. For multicolor rendering mode, this is ignored and system default values are used. This supports hex, hsl(a), rgb(a), web standard color names, PlatformColor and DynamicColorIOS values.

> required: no
>
> type: `(string | OpaqueColorValue)[]`
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

#### `renderingMode` (iOS 15+)

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

#### `variableValue` (iOS 16+)

The variable value of the symbol. Only some symbols support variable values, ususally those that represent a change in value (like `speaker.wave.3`) The variable value determines what percentage of the symbol is filled in. Learn more about variable values [here](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Variable-color).

> required: no
>
> type: `number`
>
> default: `1.0`

#### `variant` (iOS 15+)

The variant of the symbol. This is an alternate way to modify the symbol's appearance without modifying the symbol name. Learn more about symbol variants [here](https://developer.apple.com/design/human-interface-guidelines/sf-symbols#Design-variants).

> required: no
>
> type: [SymbolVariant](./src/SweetSFSymbols.types.ts)
>
> default: `none`

#### `symbolEffect` (iOS 17+)

The symbol effect of the symbol. Adds an animation to the symbol. Learn more about symbol effects [here](https://blorenzop.medium.com/how-to-animate-sf-symbols-in-swiftui-c3b504af4f44).

> required: no
>
> type: [`SymbolEffect`](./src/SweetSFSymbols.types.ts)
>
> default: `undefined`

#### `style`

The style of the symbol.

> required: no
>
> type: `ViewStyle`
>
> default: `undefined`

## Disclaimer

It's your responsibility to check Apple's rules about when and where certain icons can be used. You can check the [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/sf-symbols) and use the [official SF Symbols app](https://developer.apple.com/sf-symbols/) to check for any restrictions on the icons you want to use.

This library isn't associated with Apple, and only exposes a way to use them within React Native apps on iOS.

## Symbol names not up to date?

If you notice that the symbol names are not up to date, either submit an issue or a PR with the updated symbol names!
