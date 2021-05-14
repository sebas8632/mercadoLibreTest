//
//  SearchPresenterTest.swift
//  MercadoLibreTestTests
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import XCTest

@testable import MercadoLibreTest
class SearchPresenterTest: XCTestCase {
    
    var sut: SearchPresenter?
    let mockView: MockSearchView = MockSearchView()

    let mockInteractor: MockSearchInteractor = MockSearchInteractor()
    let mockRemoteDataManager: MockSearchRemoteDataManager = MockSearchRemoteDataManager()
    let mockRouter: MockSearchRouter = MockSearchRouter()

    override func setUpWithError() throws {
        sut = SearchPresenter()
        sut?.view = mockView
        sut?.interactor = mockInteractor
        sut?.router = mockRouter
        mockView.presenter = sut
        mockInteractor.presenter = sut
        mockInteractor.remoteDataManager = mockRemoteDataManager
        mockRemoteDataManager.interactor = mockInteractor
    }

    override func tearDownWithError() throws {
        sut?.interactor = nil
        sut?.router = nil
        mockInteractor.presenter = nil
        sut = nil
        
    }

    func testViewDidLoad() {
        // TODO
    }
    
    func testViewDidAppear() {
        // TODO
    }
    
    func testSearchProducts() {
        // Given
        let productName: String = "Volkswagen Golf TSI"
        
        // When
        sut?.searchProducts(name: productName)
        
        // Then
        XCTAssertTrue(mockInteractor.calls.searchProductsCall)
        XCTAssertTrue(mockInteractor.calls.didRetrieveProductsCall)
        XCTAssertTrue(mockView.calls.didRetrieveProductsCall)
        XCTAssertEqual(mockView.products.count, 2)
    }
    
    func testFailSearchProducts() {
        // Given
        let failProductName: String = "Fail Product Name"
        
        // When
        sut?.searchProducts(name: failProductName)
        
        // Then
        XCTAssertTrue(mockInteractor.calls.searchProductsCall)
        XCTAssertTrue(mockInteractor.calls.didRetrieveErrorCall)
        XCTAssertTrue(mockView.calls.didRetrieveError)
        XCTAssertEqual(mockView.errorMessage, "Has ocurred an error")
    }
}
