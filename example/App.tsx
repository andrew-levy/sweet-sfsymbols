import { useState } from "react";
import {
  Button,
  PlatformColor,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import SweetSFSymbol from "sweet-sfsymbols";

export default function App() {
  const [appearIsActive, setAppearIsActive] = useState(false);
  const [disappearIsActive, setDisappearIsActive] = useState(false);
  const [bounceValue, setBounceValue] = useState(false);
  const [pulseValue, setPulseValue] = useState(0);
  const [pulseIsActive, setPulseIsActive] = useState(false);
  const [scaleIsActive, setScaleIsActive] = useState(false);
  const [variableColorIsActive, setVariableColorIsActive] = useState(false);
  const [variableColorValue, setVariableColorValue] = useState(0);
  const [replaceIsActive, setReplaceIsActive] = useState(false);
  const [variableValue, setVariableValue] = useState(0);

  return (
    <ScrollView>
      <View style={styles.container}>
        {/* Symbol Variants */}
        <Text style={styles.heading}>Symbol Variants</Text>
        <Divider />
        <View style={styles.hstack}>
          <SweetSFSymbol name="speaker" variant="circle.fill.slash" />
          <SweetSFSymbol name="person" variant="circle" />
          <SweetSFSymbol name="arrowtriangle.up" variant="fill.square" />
        </View>

        {/* Rendering Modes */}
        <Text style={styles.heading}>Rendering Modes</Text>
        <Divider />
        <Text style={styles.subHeading}>Palette</Text>
        <SweetSFSymbol
          name="speaker.wave.3"
          colors={["rgb(122, 223, 332)", PlatformColor("label")]}
          renderingMode="palette"
        />
        <Divider />

        <Text style={styles.subHeading}>Hierarchical</Text>
        <SweetSFSymbol
          name="speaker.wave.3"
          colors={["orange"]}
          renderingMode="hierarchical"
        />
        <Divider />

        <Text style={styles.subHeading}>Monochrome</Text>
        <SweetSFSymbol
          name="speaker.wave.3"
          colors={["blue"]}
          renderingMode="monochrome"
        />
        <Divider />

        <Text style={styles.subHeading}>Multicolor</Text>
        <SweetSFSymbol
          name="folder.badge.plus"
          colors={["black"]}
          renderingMode="multicolor"
        />

        {/* Variable Value */}
        <Text style={styles.heading}>Variable Values</Text>
        <Divider />

        <Stepper
          value={variableValue}
          onIncrement={() => setVariableValue(variableValue + 0.1)}
          onDecrement={() => setVariableValue(variableValue - 0.1)}
        />
        <SweetSFSymbol
          name="speaker.wave.3"
          variableValue={variableValue}
          colors={["green"]}
        />

        {/* Symbol Effect */}
        <Text style={styles.heading}>Discrete Symbol Effect</Text>

        <Divider />
        <Text style={styles.subHeading}>Bounce</Text>
        <Button title="Trigger" onPress={() => setBounceValue(!bounceValue)} />
        <SweetSFSymbol
          name="person.3.fill"
          colors={["pink"]}
          symbolEffect={{
            type: "bounce",
            value: bounceValue,
            direction: "up",
          }}
        />

        <Divider />
        <Text style={styles.subHeading}>Pulse</Text>
        <Stepper
          value={pulseValue}
          onIncrement={() => setPulseValue(pulseValue + 1)}
          onDecrement={() => setPulseValue(pulseValue - 1)}
        />
        <SweetSFSymbol
          name="0.circle.fill"
          variableValue={pulseValue}
          colors={["blue"]}
          symbolEffect={{
            type: "pulse",
            value: pulseValue,
          }}
        />
        <Divider />

        <Text style={styles.subHeading}>Variable Color</Text>
        <Stepper
          value={variableColorValue}
          onIncrement={() => setVariableColorValue(variableColorValue + 1)}
          onDecrement={() => setVariableColorValue(variableColorValue - 1)}
        />
        <SweetSFSymbol
          name="speaker.wave.3"
          variableValue={variableColorValue}
          colors={["green"]}
          symbolEffect={{
            type: "variableColor",
            value: variableColorValue,
          }}
        />

        <Text style={styles.heading}>Indefinite Symbol Effects</Text>

        <Divider />
        <Text style={styles.subHeading}>Appear</Text>
        <Button
          title={appearIsActive ? "Stop" : "Start"}
          onPress={() => setAppearIsActive(!appearIsActive)}
        />
        <SweetSFSymbol
          name="square.3.layers.3d.bottom.filled"
          colors={["red"]}
          symbolEffect={{
            type: "appear",
            isActive: !appearIsActive,
            direction: "up",
          }}
        />

        <Divider />
        <Text style={styles.subHeading}>Disappear</Text>
        <Button
          title={disappearIsActive ? "Stop" : "Start"}
          onPress={() => setDisappearIsActive(!disappearIsActive)}
        />
        <SweetSFSymbol
          name="moon.haze.circle"
          colors={["black"]}
          symbolEffect={{
            type: "disappear",
            isActive: disappearIsActive,
          }}
        />

        <Divider />
        <Text style={styles.subHeading}>Pulse</Text>
        <Button
          title={pulseIsActive ? "Stop" : "Start"}
          onPress={() => setPulseIsActive(!pulseIsActive)}
        />
        <SweetSFSymbol
          name="sun.max.fill"
          colors={["orange"]}
          symbolEffect={{
            type: "pulse",
            isActive: pulseIsActive,
            repeat: true,
            speed: 2,
          }}
        />

        <Divider />
        <Text style={styles.subHeading}>Scale</Text>
        <Button
          title={scaleIsActive ? "Stop" : "Start"}
          onPress={() => setScaleIsActive(!scaleIsActive)}
        />
        <SweetSFSymbol
          name="text.justify.left"
          colors={["gray"]}
          symbolEffect={{
            type: "scale",
            isActive: scaleIsActive,
            direction: "down",
            speed: 0.5,
          }}
        />

        <Divider />
        <Text style={styles.subHeading}>Variable Color</Text>
        <Button
          title={variableColorIsActive ? "Stop" : "Start"}
          onPress={() => setVariableColorIsActive(!variableColorIsActive)}
        />
        <SweetSFSymbol
          name="speaker.wave.3"
          colors={["pink"]}
          symbolEffect={{
            type: "variableColor",
            isActive: variableColorIsActive,
          }}
        />

        <Text style={styles.heading}>Content Transition Symbol Effects</Text>

        <Divider />
        <Text style={styles.subHeading}>Replace</Text>
        <Button
          title="Toggle"
          onPress={() => setReplaceIsActive(!replaceIsActive)}
        />
        <SweetSFSymbol
          name={replaceIsActive ? "sun.max.fill" : "moon.fill"}
          colors={["orange"]}
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
  heading: {
    fontSize: 30,
    fontWeight: "bold",
    textAlign: "center",
    marginTop: 50,
  },
  subHeading: {
    fontSize: 20,
  },
  hstack: {
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
  },
  stepperContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  stepperButton: {
    backgroundColor: "black",
    borderRadius: 8,
    paddingHorizontal: 10,
    paddingVertical: 5,
  },
  stepperButtonText: {
    color: "white",
    fontSize: 30,
    fontWeight: "bold",
  },
  stepperText: {
    fontSize: 20,
    fontWeight: "bold",
    width: 50,
    textAlign: "center",
  },
  divider: {
    height: 1,
    width: "80%",
    backgroundColor: "lightgray",
  },
});

const Divider = () => <View style={styles.divider} />;

const Stepper = ({
  value,
  onIncrement,
  onDecrement,
}: {
  value: number;
  onIncrement: () => void;
  onDecrement: () => void;
}) => (
  <View style={styles.stepperContainer}>
    <TouchableOpacity style={styles.stepperButton} onPress={onDecrement}>
      <SweetSFSymbol name="minus" colors={["white"]} size={15} />
    </TouchableOpacity>
    <Text style={styles.stepperText}>{value.toFixed(1)}</Text>
    <TouchableOpacity style={styles.stepperButton} onPress={onIncrement}>
      <SweetSFSymbol name="plus" colors={["white"]} size={15} />
    </TouchableOpacity>
  </View>
);
