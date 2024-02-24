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
      return AnyView(content.symbolVariant(parseComposition(variant ?? "")))
    } else {
      return AnyView(content)
    }
  }
}

@available(iOS 15.0, *)
func parseComposition(_ composition: String) -> SymbolVariants {
  let variantMapping: [String: SymbolVariants] = [
    "none": .none,
    "circle": .circle,
    "square": .square,
    "rectangle": .rectangle,
    "fill": .fill,
    "slash": .slash
  ]
  let components = composition.split(separator: ".")
  if components.count > 0 {
    var result: SymbolVariants? = variantMapping[String(components[0])]
    for i in 1..<components.count {
      let component = components[i]
      if let symbolVariant = variantMapping[String(component)], result != nil {
        result = result!.dot(symbolVariant)
      }
    }
    return result ?? .none
  }
  return .none
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
      let options: SymbolEffectOptions = symbolEffect?.toSymbolEffectOptions() ?? .default
      let direction = symbolEffect?.direction // maybe set this to up by default for scale
      let animateBy = symbolEffect?.animateBy
      let reversing = symbolEffect?.reversing
      let inactiveLayers = symbolEffect?.inactiveLayers
      
      switch symbolEffect?.type {
      case "bounce":
        var bounceEffect: BounceSymbolEffect = .bounce
        if direction == "up" {
          bounceEffect = bounceEffect.up
        } else if direction == "down" {
          bounceEffect = bounceEffect.down
        }
        if animateBy == "layer" {
          bounceEffect = bounceEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          bounceEffect = bounceEffect.wholeSymbol
        }
        if let value = symbolEffect?.value as? Double {
          return AnyView(content.symbolEffect(bounceEffect, options: options, value: value))
        } else {
          return AnyView(content)
        }
      case "pulse":
        var pulseEffect: PulseSymbolEffect = .pulse
        if animateBy == "layer" {
          pulseEffect = pulseEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          pulseEffect = pulseEffect.wholeSymbol
        }
        if let isActive = symbolEffect?.isActive {
          return AnyView(content.symbolEffect(pulseEffect, options: options, isActive: isActive))
        } else if let value = symbolEffect?.value as? Double {
          return AnyView(content.symbolEffect(pulseEffect, options: options, value: value))
        } else {
          return AnyView(content.symbolEffect(pulseEffect, options: options))
        }
      case "variableColor":
        var variableColorEffect: VariableColorSymbolEffect = .variableColor
        if reversing == true {
          variableColorEffect = variableColorEffect.reversing
        }
        if inactiveLayers == "hide" {
          variableColorEffect = variableColorEffect.hideInactiveLayers
        } else if inactiveLayers == "dim" {
          variableColorEffect = variableColorEffect.dimInactiveLayers
        }
        if animateBy == "layer" {
          variableColorEffect = variableColorEffect.iterative
        } else if animateBy == "wholeSymbol" {
          variableColorEffect = variableColorEffect.cumulative
        }
        if let isActive = symbolEffect?.isActive {
          return AnyView(content.symbolEffect(.variableColor, options: options, isActive: isActive))
        } else if let value = symbolEffect?.value as? any Equatable {
          return AnyView(content.symbolEffect(.variableColor, options: options, value: value))
        } else {
          return AnyView(content.symbolEffect(.variableColor, options: options))
        }
      case "appear":
        var appearEffect: AppearSymbolEffect = .appear
        if direction == "up" {
          appearEffect = appearEffect.up
        } else if direction == "down" {
          appearEffect = appearEffect.down
        }
        if animateBy == "layer" {
          appearEffect = appearEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          appearEffect = appearEffect.wholeSymbol
        }
        return AnyView(content.symbolEffect(appearEffect, options: options, isActive:  symbolEffect?.isActive ?? false))
      case "disappear":
        var disappearEffect: DisappearSymbolEffect = .disappear
        if direction == "up" {
          disappearEffect = disappearEffect.up
        } else if direction == "down" {
          disappearEffect = disappearEffect.down
        }
        if animateBy == "layer" {
          disappearEffect = disappearEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          disappearEffect = disappearEffect.wholeSymbol
        }
        return AnyView(content.symbolEffect(disappearEffect, options: options, isActive:  symbolEffect?.isActive ?? false))
      case "scale":
        var scaleEffect: ScaleSymbolEffect = .scale
        if direction == "up" || direction == nil {
          scaleEffect = scaleEffect.up
        } else if direction == "down" {
          scaleEffect = scaleEffect.down
        }
        if animateBy == "layer" {
          scaleEffect = scaleEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          scaleEffect = scaleEffect.wholeSymbol
        }
        if let isActive = symbolEffect?.isActive {
          return AnyView(content.symbolEffect(scaleEffect, options: options, isActive: isActive))
        } else {
          return AnyView(content.symbolEffect(scaleEffect, options: options))
        }
      case "replace":
        var replaceEffect: ReplaceSymbolEffect = .replace
        if direction == "downUp" {
          replaceEffect = replaceEffect.downUp
        } else if direction == "upUp" {
          replaceEffect = replaceEffect.upUp
        } else if direction == "offUp" {
          replaceEffect = replaceEffect.offUp
        }
        if animateBy == "layer" {
          replaceEffect = replaceEffect.byLayer
        } else if animateBy == "wholeSymbol" {
          replaceEffect = replaceEffect.wholeSymbol
        }
        return AnyView(content.contentTransition(.symbolEffect(replaceEffect, options: options)))
      default:
        return AnyView(content)
      }
    } else {
      return AnyView(content)
    }
  }
}


