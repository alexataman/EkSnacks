// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.3.4

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import Foundation
@testable import EkreativeSnacks


// MARK: - SnacksInteractorInput
open class SnacksInteractorInputMock: SnacksInteractorInput, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var snackNetwork: SnackNetwork? {
		get {	invocations.append(.p_snackNetwork_get); return __p_snackNetwork ?? optionalGivenGetterValue(.p_snackNetwork_get, "SnacksInteractorInputMock - stub value for snackNetwork was not defined") }
		set {	invocations.append(.p_snackNetwork_set(.value(newValue))); __p_snackNetwork = newValue }
	}
	private var __p_snackNetwork: (SnackNetwork)?

    public var snacksPresenterOutput: SnacksPresenterOutput? {
		get {	invocations.append(.p_snacksPresenterOutput_get); return __p_snacksPresenterOutput ?? optionalGivenGetterValue(.p_snacksPresenterOutput_get, "SnacksInteractorInputMock - stub value for snacksPresenterOutput was not defined") }
		set {	invocations.append(.p_snacksPresenterOutput_set(.value(newValue))); __p_snacksPresenterOutput = newValue }
	}
	private var __p_snacksPresenterOutput: (SnacksPresenterOutput)?





    open func fetchSnacks() {
        addInvocation(.m_fetchSnacks)
		let perform = methodPerformValue(.m_fetchSnacks) as? () -> Void
		perform?()
    }

    open func delete(id: Int) {
        addInvocation(.m_delete__id_id(Parameter<Int>.value(`id`)))
		let perform = methodPerformValue(.m_delete__id_id(Parameter<Int>.value(`id`))) as? (Int) -> Void
		perform?(`id`)
    }


    fileprivate enum MethodType {
        case m_fetchSnacks
        case m_delete__id_id(Parameter<Int>)
        case p_snackNetwork_get
		case p_snackNetwork_set(Parameter<SnackNetwork?>)
        case p_snacksPresenterOutput_get
		case p_snacksPresenterOutput_set(Parameter<SnacksPresenterOutput?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchSnacks, .m_fetchSnacks):
                return true 
            case (.m_delete__id_id(let lhsId), .m_delete__id_id(let rhsId)):
                guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                return true 
            case (.p_snackNetwork_get,.p_snackNetwork_get): return true
			case (.p_snackNetwork_set(let left),.p_snackNetwork_set(let right)): return Parameter<SnackNetwork?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_snacksPresenterOutput_get,.p_snacksPresenterOutput_get): return true
			case (.p_snacksPresenterOutput_set(let left),.p_snacksPresenterOutput_set(let right)): return Parameter<SnacksPresenterOutput?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_fetchSnacks: return 0
            case let .m_delete__id_id(p0): return p0.intValue
            case .p_snackNetwork_get: return 0
			case .p_snackNetwork_set(let newValue): return newValue.intValue
            case .p_snacksPresenterOutput_get: return 0
			case .p_snacksPresenterOutput_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func snackNetwork(getter defaultValue: SnackNetwork?...) -> PropertyStub {
            return Given(method: .p_snackNetwork_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func snacksPresenterOutput(getter defaultValue: SnacksPresenterOutput?...) -> PropertyStub {
            return Given(method: .p_snacksPresenterOutput_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchSnacks() -> Verify { return Verify(method: .m_fetchSnacks)}
        public static func delete(id: Parameter<Int>) -> Verify { return Verify(method: .m_delete__id_id(`id`))}
        public static var snackNetwork: Verify { return Verify(method: .p_snackNetwork_get) }
		public static func snackNetwork(set newValue: Parameter<SnackNetwork?>) -> Verify { return Verify(method: .p_snackNetwork_set(newValue)) }
        public static var snacksPresenterOutput: Verify { return Verify(method: .p_snacksPresenterOutput_get) }
		public static func snacksPresenterOutput(set newValue: Parameter<SnacksPresenterOutput?>) -> Verify { return Verify(method: .p_snacksPresenterOutput_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchSnacks(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_fetchSnacks, performs: perform)
        }
        public static func delete(id: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_delete__id_id(`id`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - SnacksRouterInput
open class SnacksRouterInputMock: SnacksRouterInput, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func showLogin() {
        addInvocation(.m_showLogin)
		let perform = methodPerformValue(.m_showLogin) as? () -> Void
		perform?()
    }

    open func showAddSnack() {
        addInvocation(.m_showAddSnack)
		let perform = methodPerformValue(.m_showAddSnack) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_showLogin
        case m_showAddSnack

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_showLogin, .m_showLogin):
                return true 
            case (.m_showAddSnack, .m_showAddSnack):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_showLogin: return 0
            case .m_showAddSnack: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showLogin() -> Verify { return Verify(method: .m_showLogin)}
        public static func showAddSnack() -> Verify { return Verify(method: .m_showAddSnack)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showLogin(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showLogin, performs: perform)
        }
        public static func showAddSnack(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showAddSnack, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

