import SwiftUI

@main
struct Capstone_IOSApp: App {
    @State private var showMenu: Bool = false
    @State private var nextSlideEnabled: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                IntroView(showMenu: $showMenu)
            }
        }
    }
}
