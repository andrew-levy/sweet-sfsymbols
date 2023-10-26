import { useState } from "react";
import { Button, StyleSheet, Text, View } from "react-native";
import SweetSFSymbol from "../src";

export default function App() {
  const [varaibleValue, setVariableValue] = useState(0);
  console.log(varaibleValue);
  return (
    <View style={styles.container}>
      <Text style={{ fontSize: 30 }}>SF Symbols</Text>
      <Button
        title="Volume Up"
        onPress={() => setVariableValue(varaibleValue + 0.1)}
      />
      <Button
        title="Volume Down"
        onPress={() => setVariableValue(varaibleValue - 0.1)}
      />
      <SweetSFSymbol
        name="speaker.wave.3"
        size={100}
        colors={["lightblue", "green"]}
        weight="ultraLight"
        renderingMode="palette"
        variableValue={varaibleValue}
        variant="fill"
        scale="medium"
        style={{
          marginVertical: 20,
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
