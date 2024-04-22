import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

import { ProcessedColorValue, processColor } from "react-native";
import {
  NativeSymbolEffect,
  SweetSFSymbolsViewProps,
} from "./SweetSFSymbols.types";

const NativeView: React.ComponentType<
  Omit<SweetSFSymbolsViewProps, "symbolEffect" | "colors"> & {
    symbolEffect?: NativeSymbolEffect;
    colors: (string | ProcessedColorValue | null | undefined | object)[];
  }
> = requireNativeViewManager("SweetSFSymbols");

export default class SweetSFSymbol extends React.PureComponent<SweetSFSymbolsViewProps> {
  render() {
    const {
      style,
      size = 50,
      symbolEffect,
      colors,
      variableValue = 1.0,
      ...restProps
    } = this.props;
    const repeatValue =
      symbolEffect && "repeat" in symbolEffect ? symbolEffect?.repeat : 1;
    const repeatCount = repeatValue === true ? -1 : 1;
    const effect = {
      ...symbolEffect,
      repeatCount,
    } as NativeSymbolEffect;

    return (
      <NativeView
        {...restProps}
        size={size}
        colors={getColors(colors)}
        symbolEffect={effect}
        variableValue={variableValue}
        style={{
          ...style,
          width: size,
          height: size,
        }}
      />
    );
  }
}

function isHslOrRgbColor(color: string) {
  if (typeof color !== "string") return false;
  return color.startsWith("hsl") || color.startsWith("rgb");
}

function getColors(colors?: SweetSFSymbolsViewProps["colors"]) {
  return (
    colors?.map((color) => {
      if (typeof color === "string" && isHslOrRgbColor(color)) {
        return processColor(color);
      }
      return color;
    }) ?? []
  );
}
