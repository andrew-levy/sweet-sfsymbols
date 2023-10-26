import ExpoModulesCore
import SwiftUI

public class SweetSFSymbolsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("SweetSFSymbols")
    View(SweetSFSymbolsView.self) {
      Prop("name") { (view: SweetSFSymbolsView, name: String?) in
        view.props.name = name ?? ""
      }
      Prop("weight") { (view:SweetSFSymbolsView, weight: SFSymbolWeight?) in
        view.props.weight = weight ?? .medium
      }
      Prop("scale") { (view: SweetSFSymbolsView, scale: SFSymbolScale?) in
        view.props.scale = scale ?? .medium
      }
      Prop("size") { (view: SweetSFSymbolsView, size: Double?) in
        view.props.size = size ?? 50.0
      }
      Prop("colors") { (view: SweetSFSymbolsView, colors: [UIColor]?) in
        view.props.colors = colors ?? [UIColor.black]
      }
      Prop("renderingMode") { (view: SweetSFSymbolsView, renderingMode: SFSymbolRenderingMode?) in
        view.props.renderingMode = renderingMode ?? .monochrome
      }
      Prop("variableValue") { (view: SweetSFSymbolsView, variableValue: Double?) in
        view.props.variableValue = variableValue ?? 1.0
      }
      Prop("variant") { (view: SweetSFSymbolsView, variant: String?) in
        view.props.variant = variant ?? nil
      }
      Prop("symbolEffect") { (view: SweetSFSymbolsView, symbolEffect: SFSymbolEffect?) in
        view.props.symbolEffect = symbolEffect ?? nil
      }
    }
  }
}
