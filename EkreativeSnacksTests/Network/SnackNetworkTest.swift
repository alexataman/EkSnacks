//
//  SnackNetworkTest.swift
//  EkreativeSnacksTests
//
//  Created by Alex on 11/3/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//
import Alamofire
import Moya
import Nimble
import Quick

@testable import EkreativeSnacks

final class SnackNetworkTest: QuickSpec, NetworkProtocol {

    typealias NetworkType = SnackNetwork

    var method: HTTPMethod?
    var headers: [String: String]?
    var url: String?

    var network: SnackNetwork?
    
    private lazy var requestClosure = configurate(SnackTargetType.self) {
        self.method = $0
        self.headers = $1
        self.url = $2
    }

    override func spec() {
        describe("'Fetch snacks' should return correct response") {
            // find json with mocked data
            let data = Bundle(for: type(of: self)).jsonData(with: "Snacks")
            // create endpoint closure
            let closure = endpointClosure(SnackTargetType.fetch, data: data)
            // create povider
            let provider = MoyaProvider<SnackTargetType>(
                endpointClosure: {_ in  return closure},
                requestClosure: requestClosure,
                stubClosure: MoyaProvider.immediatelyStub
            )
            // register provider
            Injector.shared.register(network: .snack(provider))
            
            // init network stub
            do {
                let stub = Injector.shared.load(SnackNetwork.self)
                network = try AssertNotNilAndUnwrap(stub)
            } catch {
                XCTFail("SnackTestError: Stub should be registered")
            }
        }

        it("Endpoint '.post' should have correct parameters.") {
            waitUntil { done in
                self.network?.fetch().done { snacks in
                    let snack = snacks.first
                    
                    expect(snacks.count) == 1
                    expect(snack?.id) == 23
                    expect(snack?.name) == "Raj sandwich"
                    expect(snack?.date) == "2016-08-29T09:12:33.001Z"
                    expect(snack?.price) == 35
                    expect(snack?.user) == "Sasha Atamanskyi"
                    
                    expect(self.method) == .get
                    expect(self.headers).to(beNil())
                    expect(self.baseURL.absoluteString) == self.url
                    
                    done()
                }.cauterize()
            }
        }
    }
}
