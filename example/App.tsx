import { useState } from "react";
import { Button, ScrollView, StyleSheet, Text, View } from "react-native";
import SweetSFSymbol from "sweet-sfsymbols";

export default function App() {
  const [varaibleValue, setVariableValue] = useState(0);
  const [isActive, setIsActive] = useState(false);
  return (
    <ScrollView>
      <View style={styles.container}>
        <View>
          <Text style={{ fontSize: 30 }}>SF Symbols</Text>
          <Button
            title="Volume Up"
            onPress={() => setVariableValue(varaibleValue + 0.1)}
          />
          <Button
            title="Volume Down"
            onPress={() => setVariableValue(varaibleValue - 0.1)}
          />
          <Button title="Toggle" onPress={() => setIsActive((prev) => !prev)} />
        </View>
        {/* Weight */}
        <SweetSFSymbol name="dot.circle.and.cursorarrow" weight="light" />

        {/* Size */}
        <SweetSFSymbol name="arrow.up.and.down.square.fill" size={20} />

        {/* Scale */}
        <SweetSFSymbol name="chart.bar.doc.horizontal" scale="large" />

        {/* Rendering Mode */}
        <SweetSFSymbol
          name="speaker.wave.3"
          renderingMode="palette"
          colors={["lightblue", "green"]}
        />

        {/* Variable Value */}
        <SweetSFSymbol name="speaker.wave.3" variableValue={varaibleValue} />

        {/* Variant */}
        <SweetSFSymbol name="chevron.backward" variant="circle.fill" />

        {/* Symbol Effect */}
        <SweetSFSymbol
          name="speaker.wave.3"
          variableValue={varaibleValue}
          symbolEffect={{
            type: "bounce",
            value: varaibleValue,
            direction: "up",
          }}
        />
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingVertical: 100,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
    gap: 20,
  },
});
