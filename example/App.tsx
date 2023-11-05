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
        {/* <SweetSFSymbol name="arrow.up.and.down.square.fill" size={20} /> */}

        {/* Scale */}
        {/* <SweetSFSymbol name="chart.bar.doc.horizontal" scale="large" /> */}

        {/* Rendering Mode */}
        <SweetSFSymbol
          name="person.3"
          renderingMode="palette"
          colors={["lightblue", "green"]}
        />

        {/* Variant */}
        <SweetSFSymbol
          name="chevron.backward"
          variant="circle.fill"
          colors={["orange", "green"]}
        />

        {/* Symbol Effect */}
        <SweetSFSymbol
          name="speaker.wave.3"
          variableValue={varaibleValue}
          colors={["pink"]}
          symbolEffect={{
            type: "bounce",
            value: varaibleValue,
            direction: "up",
          }}
        />

        <SweetSFSymbol
          name={isActive ? "speaker.wave.3" : "speaker.zzz.fill"}
          colors={["blue"]}
          symbolEffect={{
            type: "replace",
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
