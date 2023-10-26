import ExpoModulesCore
import SwiftUI

class Props: ObservableObject {
  @Published var name: String = ""
  @Published var weight: SFSymbolWeight = .regular
  @Published var scale: SFSymbolScale = .medium
  @Published var size: Double = 0
  @Published var colors: [UIColor] = []
  @Published var renderingMode: SFSymbolRenderingMode = .monochrome
  @Published var variableValue: Double = 0
  @Published var variant: String? = nil
  @Published var symbolEffect: SFSymbolEffect? = nil
}

struct SweetSFSymbolSwiftUIView: View {
  @ObservedObject var props: Props
  
  var body: some View {
    let image: Image
    if #available(iOS 16.0, *) {
      image = Image(systemName: props.name, variableValue: props.variableValue)
    } else {
      image = Image(systemName: props.name)
    }
    return image
      .imageScale(props.scale.toImageScale())
      .font(.system(size: props.size, weight: props.weight.toFontWeight()))
      .customColors(props.colors)
      .customRenderingMode(props.renderingMode)
      .customVariant(props.variant)
      .customSymbolEffect(props.symbolEffect)
  }
}
