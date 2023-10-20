import * as React from 'react';

import { SweetSFSymbolsViewProps } from './SweetSFSymbols.types';

export default function SweetSFSymbolsView(props: SweetSFSymbolsViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
