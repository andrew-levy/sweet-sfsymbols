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
  @Field var repeatCount: Int?
  @Field var speed: Double?
  @Field var reversing: Bool?
  @Field var direction: String?
  @Field var animateBy: String?
  @Field var inactiveLayers: String?
  @Field var value: Double?
  @Field var isActive: Bool?
  
  @available(iOS 17.0, *)
  func toSymbolEffectOptions() -> SymbolEffectOptions {
    var options: SymbolEffectOptions
    if repeatCount != nil {
      if repeatCount == -1  {
        options = .repeating.speed(speed ?? 1.0)
      } else {
        options = .repeat(repeatCount).speed(speed ?? 1.0)
      }
    } else {
      options = .nonRepeating.speed(speed ?? 1.0)
    }
    return options
  }
}
