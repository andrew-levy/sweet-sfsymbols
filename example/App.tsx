import { useState } from "react";
import { Button, StyleSheet, Text, View } from "react-native";
import SweetSFSymbol from "../src";

export default function App() {
  const [varaibleValue, setVariableValue] = useState(0);
  console.log(varaibleValue);
  return (
    <View style={styles.container}>
      <Text>SF Symbols</Text>
      <Button
        title="up"
        onPress={() => setVariableValue(varaibleValue + 0.1)}
      />
      <Button
        title="down"
        onPress={() => setVariableValue(varaibleValue - 0.1)}
      />

      <SweetSFSymbol
        name="person.3"
        size={100}
        colors={["lightblue", "green"]}
        weight="ultraLight"
        renderingMode="palette"
        variableValue={varaibleValue}
        scale="medium"
        symbolEffect={{
          type: "bounce",
          speed: 100,
          isActive: true,
          value: varaibleValue,
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
