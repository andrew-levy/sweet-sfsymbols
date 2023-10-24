import SwiftUI

extension View {
  func customColors(_ colors: [UIColor]) -> some View {
    modifier(ColorsModifier(colors: colors))
  }
  func renderingMode(_ renderingMode: SFSymbolRenderingMode) -> some View {
    modifier(RenderingModeModifier(renderingMode: renderingMode))
  }
  func customSymbolEffect(_ symbolEffect: SFSymbolEffect?) -> some View {
    modifier(SymbolEffectModifier(symbolEffect: symbolEffect))
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


