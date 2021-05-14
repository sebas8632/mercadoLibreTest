//
//  SearchInteractorTest.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import XCTest

@testable import MercadoLibreTest
class SearchInteractorTest: XCTestCase {
    
    var sut: SearchInteractor?
    let mockRemoteDataManager: MockSearchRemoteDataManager = MockSearchRemoteDataManager()
    let mockPresenter: MockSearchPresenter = MockSearchPresenter()

    override func setUpWithError() throws {
        sut = SearchInteractor()
        sut?.remoteDataManager = mockRemoteDataManager
        mockRemoteDataManager.interactor = sut
        sut?.presenter = mockPresenter
    }

    override func tearDownWithError() throws {
        sut?.remoteDataManager = nil
        sut?.presenter = nil
        mockRemoteDataManager.interactor = nil
        sut = nil
    }

    func testSearchProducts() throws {
        // Given
        let name: String = "Volkswagen Golf TSI"
        // When
        sut?.searchProducts(name: name)
        // Then
        XCTAssertTrue(mockRemoteDataManager.calls.searchProducts)
        XCTAssertTrue(mockPresenter.calls.didRetrieveProducts)
        XCTAssertEqual(mockPresenter.arrayProducts.count, 2)
        XCTAssertEqual(mockPresenter.arrayProducts.first?.identifier, "hkjh")
    }

    func testFailSearchProducts() throws {
        // Given
        let failname: String = "Fail Product Name"
        // When
        sut?.searchProducts(name: failname)
        // Then
        XCTAssertTrue(mockRemoteDataManager.calls.searchProducts)
        XCTAssertTrue(mockPresenter.calls.didRetrieveError)
        XCTAssertEqual(mockPresenter.errorMessage, "Has ocurred an error")
    }

}
