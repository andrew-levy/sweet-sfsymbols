import { StyleSheet, Text, View } from 'react-native';

import * as SweetSFSymbols from 'sweet-sfsymbols';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{SweetSFSymbols.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
