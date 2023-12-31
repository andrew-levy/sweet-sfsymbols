import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

import {
  NativeSymbolEffect,
  SweetSFSymbolsViewProps,
} from "./SweetSFSymbols.types";

const NativeView: React.ComponentType<
  Omit<SweetSFSymbolsViewProps, "symbolEffect"> & {
    symbolEffect?: NativeSymbolEffect;
  }
> = requireNativeViewManager("SweetSFSymbols");

export default class SweetSFSymbol extends React.PureComponent<SweetSFSymbolsViewProps> {
  render() {
    const { style, size = 50, symbolEffect, ...restProps } = this.props;
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
        symbolEffect={effect}
        style={{
          ...style,
          width: size,
          height: size,
        }}
      />
    );
  }
}
