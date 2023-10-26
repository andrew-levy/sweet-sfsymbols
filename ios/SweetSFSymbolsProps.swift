import ExpoModulesCore
import SwiftUI

enum SFSymbolRenderingMode: String, Enumerable {
  case hierarchical
  case palette
  case multicolor
  case monochrome
  
  @available(iOS 15.0, *)
  func toSFSymbolRenderingMode() -> SymbolRenderingMode {
      switch self {
      case .hierarchical:
          return .hierarchical
      case .monochrome:
        return .monochrome
      case .multicolor:
        return .multicolor
      case .palette:
        return .palette
      }
  }
}

enum SFSymbolScale: String, Enumerable {
  case small
  case medium
  case large
    
  func toImageScale() -> Image.Scale {
    switch self {
    case .small:
      return .small
    case .medium:
      return .medium
    case .large:
      return .large
    }
  }
}

enum SFSymbolWeight: String, Enumerable {
    case bold
    case heavy
    case medium
    case light
    case regular
    case semibold
    case thin
    case ultraLight
    case black
    
    func toFontWeight() -> Font.Weight {
        switch self {
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .medium:
            return .medium
        case .light:
            return .light
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .thin:
            return .thin
        case .ultraLight:
            return .ultraLight
        case .black:
            return .black
        }
    }
}

struct SFSymbolEffect: Record {
  @Field var type: String
  @Field var options: String?
  @Field var value: Double?
  
  func mapToSymbolEffect(_ sfSymbolEffect: SFSymbolEffect)  {
    
  }

}
