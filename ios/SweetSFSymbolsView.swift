import ExpoModulesCore
import SwiftUI

class SweetSFSymbolsView: ExpoView {
  let props = Props()

  required init(appContext: AppContext? = nil) {
    let hostingController = UIHostingController(rootView: SFSymbolSwiftUIView(props: props))

    super.init(appContext: appContext)

    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    hostingController.view.backgroundColor = .clear
    
    addSubview(hostingController.view)
    NSLayoutConstraint.activate([
      hostingController.view.topAnchor.constraint(equalTo: self.topAnchor),
      hostingController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      hostingController.view.leftAnchor.constraint(equalTo: self.leftAnchor),
      hostingController.view.rightAnchor.constraint(equalTo: self.rightAnchor)
    ])
  }
}

struct SFSymbolSwiftUIView: View {
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
      .modifier(ColorsModifier(colors: props.colors))
      .modifier(RenderingModeModifier(renderingMode: props.renderingMode))
    
  }
}

class Props: ObservableObject {
  @Published var name: String = ""
  @Published var weight: SFSymbolWeight = .regular
  @Published var scale: SFSymbolScale = .medium
  @Published var size: Double = 0
  @Published var colors: [UIColor] = []
  @Published var renderingMode: SFSymbolRenderingMode = .monochrome
  @Published var variableValue: Double = 0
//  @Published var symbolEffect: SFSymbolEffect = .none

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

