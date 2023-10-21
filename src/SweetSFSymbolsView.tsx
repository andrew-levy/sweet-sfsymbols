import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

import { SweetSFSymbolsViewProps } from "./SweetSFSymbols.types";

const NativeView: React.ComponentType<SweetSFSymbolsViewProps> =
  requireNativeViewManager("SweetSFSymbols");

export class SweetSFSymbolsView extends React.PureComponent<SweetSFSymbolsViewProps> {
  render() {
    const { style, size = 50, ...restProps } = this.props;

    return (
      <NativeView
        {...restProps}
        size={size}
        style={{
          ...style,
          width: size,
          height: size,
        }}
      />
    );
  }
}
