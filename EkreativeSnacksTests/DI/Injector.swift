import Swinject
import SwinjectStoryboard
import Moya

@testable import EkreativeSnacks

final class Injector {
    
    //MARK: Shared
    
    static let shared = Injector()
    
    // MARK: Private properties
    
    // MARK: Init
    
    private(set) var container: Container = {
        return .init()
    }()
    
    // MARK: - Implementation
    
    func load<Service>(_ serviceType: Service.Type, name: String? = "stub") -> Service {
        guard let resolved = container.resolve(serviceType, name: name) else {
            fatalError("Couldn't resolve \(serviceType)")
        }
        return resolved
    }
    
    // MARK: - Public functions
    
    func register(network: NetworkType) {
        switch network {
        case .snack(let provider):
            container.register(SnackNetwork.self, name: "stub") { resolver in
                .init(provider: provider)
            }
        }
    }
    
}
