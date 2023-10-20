import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { SweetSFSymbolsViewProps } from './SweetSFSymbols.types';

const NativeView: React.ComponentType<SweetSFSymbolsViewProps> =
  requireNativeViewManager('SweetSFSymbols');

export default function SweetSFSymbolsView(props: SweetSFSymbolsViewProps) {
  return <NativeView {...props} />;
}
