//
//  SearchViewTest.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import XCTest

@testable import MercadoLibreTest
class SearchViewTest: XCTestCase {
    
    var sut: SearchViewController?
    let mockPresenter: MockSearchPresenter = MockSearchPresenter()
    let mockInteractor: MockSearchInteractor = MockSearchInteractor()
    let mockRemoteDataManager: MockSearchRemoteDataManager  = MockSearchRemoteDataManager()
    let mockRouter: MockSearchRouter = MockSearchRouter()

    override func setUpWithError() throws {
        sut = SearchViewController()
        sut?.presenter = mockPresenter
        mockPresenter.view = sut
        mockPresenter.interactor = mockInteractor
        mockPresenter.router = mockRouter
        mockInteractor.presenter = mockPresenter
        mockInteractor.remoteDataManager = mockRemoteDataManager
        mockRemoteDataManager.interactor = mockInteractor
    }

    override func tearDownWithError() throws {
        sut?.presenter = nil
        mockPresenter.view = nil
        mockPresenter.interactor = nil
        mockPresenter.router = nil
        mockInteractor.presenter = nil
        mockInteractor.remoteDataManager = nil
        mockRemoteDataManager.interactor = nil
        sut = nil
    }
    
    func testSearchItems() {
        // Given
        let itemName: String = "Volkswagen Golf TSI"
        
        // When
        sut?.searchItems(item: itemName)
        
        // Then
        XCTAssertTrue(mockPresenter.calls.searchProducts)
        XCTAssertTrue(mockPresenter.calls.didRetrieveProducts)
        XCTAssertEqual(sut?.products.count, 2)
        XCTAssertEqual(sut?.products.first?.name, "Volkswagen Golf TSI")
        
    }
    
    func testFailSearchItems() {
        // Given
        let itemName: String = "Fail Product Name"
        
        // When
        sut?.searchItems(item: itemName)
        
        // Then
        XCTAssertTrue(mockPresenter.calls.searchProducts)
        XCTAssertTrue(mockPresenter.calls.didRetrieveError)
        XCTAssertNotNil(mockPresenter.error)
    }

}
