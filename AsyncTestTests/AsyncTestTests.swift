//
//  AsyncTestTests.swift
//  AsyncTestTests
//
//  Created by Swift on 21/06/17.
//  Copyright © 2017 HalphDem. All rights reserved.
//

import XCTest
@testable import AsyncTest

class AsyncTestTests: XCTestCase {
    
    var repository: RemoteRepository?
    
    var cepGlobal: CepModel? = nil
    
    override func setUp() {
        super.setUp()
        repository = RemoteRepository()
        cepGlobal = nil
    }
    
    override func tearDown() {
        cepGlobal = nil
        repository = RemoteRepository()
        super.tearDown()
    }
    
    func testExample() {
        let cepExpectation = expectation(description: "Teste do cep")
        
        repository?.doRequest(callBack: { (cepResponse, error) in
            
            if let cep = cepResponse {
                XCTAssert(cep.bairro == "Sé")
                cepExpectation.fulfill()
            }
        })
        wait(for: [cepExpectation], timeout: 2)
    }
    
    func testMock() {
    
        func innerCallBack(cepResponse: CepModel?, errorResponse: NSError?) {
            if let cep = cepResponse {
                cepGlobal = cep
            }
        }
        
        class MockRemoteRepository: RemoteRepository {
            override func doRequest(callBack: @escaping (CepModel?, NSError?) -> Void) {
                let cep = CepModel(bairro: "Sé")
                
                callBack(cep, nil)
            }
        }
        
        let repositoryMock = MockRemoteRepository()
        
        repositoryMock.doRequest(callBack: innerCallBack)
        
        XCTAssert(cepGlobal?.bairro == "Sé")
    }
}
