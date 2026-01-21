import ContentBlockingGenerator

@main
public struct MainContentBlockerGenerator {
    // FXIOS-14548 ContentBlockerGenerator is not thread safe
    nonisolated(unsafe) static let generator = ContentBlockerGenerator.factory()

    // Static main needs to be used for executable, providing an instance so we can
    // call it from a terminal
    public static func main() {
        generator.generateLists()
    }
}
