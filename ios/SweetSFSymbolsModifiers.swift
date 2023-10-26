import SwiftUI

extension View {
  func customColors(_ colors: [UIColor]) -> some View {
    modifier(ColorsModifier(colors: colors))
  }
  func customRenderingMode(_ renderingMode: SFSymbolRenderingMode) -> some View {
    modifier(RenderingModeModifier(renderingMode: renderingMode))
  }
  func customSymbolEffect(_ symbolEffect: SFSymbolEffect?) -> some View {
    modifier(SymbolEffectModifier(symbolEffect: symbolEffect))
  }
  func customVariant(_ variant: String?) -> some View {
    modifier(VariantModifier(variant: variant))
  }
}

struct ColorsModifier: ViewModifier {
  var colors: [UIColor]
  func body(content: Content) -> some View {
    if colors.count == 1 {
      return AnyView(content.foregroundColor(Color(colors[0])))
    } else if colors.count == 2 {
        if #available(iOS 15.0, *) {
          return AnyView(content.foregroundStyle(Color(colors[0]), Color(colors[1])))
        } else {
          return AnyView(content.foregroundColor(Color(colors[0])))
        }
    } else if colors.count == 3 {
        if #available(iOS 15.0, *) {
          return AnyView(content.foregroundStyle(Color(colors[0]), Color(colors[1]), Color(colors[2])))
        } else {
          return AnyView(content.foregroundColor(Color(colors[0])))
        }
    } else {
      return AnyView(content)
    }
  }
}

struct RenderingModeModifier: ViewModifier {
  var renderingMode: SFSymbolRenderingMode
  func body(content: Content) -> some View {
    if #available(iOS 15.0, *) {
      return AnyView(content.symbolRenderingMode(renderingMode.toSFSymbolRenderingMode()))
    } else {
      return AnyView(content)
    }
  }
}

struct VariantModifier: ViewModifier {
  var variant: String?
  func body(content: Content) -> some View {
    if #available(iOS 15.0, *) {
      return AnyView(content.symbolVariant(parseComposition(variant ?? "") ?? .none))
    } else {
      return AnyView(content)
    }
  }
}

@available(iOS 15.0, *)
func parseComposition(_ composition: String) -> SymbolVariants? {
  let variantMapping: [String: SymbolVariants] = [
    "none": .none,
    "circle": .circle,
    "square": .square,
    "rectangle": .rectangle,
    "fill": .fill,
    "slash": .slash
  ]
  let components = composition.split(separator: ".")
  var result: SymbolVariants? = variantMapping[String(components[0])]
  for i in 1..<components.count {
    let component = components[i]
    if let symbolVariant = variantMapping[String(component)], result != nil {
      result = result!.dot(symbolVariant)
    }
  }
  return result
}

@available(iOS 15.0, *)
public extension SymbolVariants {
  func dot(_ other: SymbolVariants) -> SymbolVariants {
    switch other {
    case .circle: return self.circle
    case .fill: return self.fill
    case .slash: return self.slash
    case .rectangle: return self.rectangle
    case .square: return self.square
    default: return self
    }
  }
}


struct SymbolEffectModifier: ViewModifier {
  var symbolEffect: SFSymbolEffect?
  func body(content: Content) -> some View {
    if symbolEffect == nil {
      return AnyView(content)
    }
    if #available(iOS 17.0, *) {
      return AnyView(content)
    } else {
      return AnyView(content)
    }
  }
}


