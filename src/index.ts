import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to SweetSFSymbols.web.ts
// and on native platforms to SweetSFSymbols.ts
import SweetSFSymbolsModule from './SweetSFSymbolsModule';
import SweetSFSymbolsView from './SweetSFSymbolsView';
import { ChangeEventPayload, SweetSFSymbolsViewProps } from './SweetSFSymbols.types';

// Get the native constant value.
export const PI = SweetSFSymbolsModule.PI;

export function hello(): string {
  return SweetSFSymbolsModule.hello();
}

export async function setValueAsync(value: string) {
  return await SweetSFSymbolsModule.setValueAsync(value);
}

const emitter = new EventEmitter(SweetSFSymbolsModule ?? NativeModulesProxy.SweetSFSymbols);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { SweetSFSymbolsView, SweetSFSymbolsViewProps, ChangeEventPayload };
