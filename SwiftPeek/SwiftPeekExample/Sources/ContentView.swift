import SwiftUI
import SwiftPeek

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text("Hello, World!")
            .padding()
        Button("Show SwiftPeek") {
            SwiftPeekManager.shared.show()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
