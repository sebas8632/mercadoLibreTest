//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import UIKit

class SearchViewController: UIViewController, SearchViewInputProtocol {

    var presenter: SearchPresenterInputProtocol?
    
    lazy var products: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchItems(item: "Volkswagen GTI")
    }
    
    override func loadView() {
        view = SearchView()
    }
    
    func setupView() {
        // TODO
    }
    
    func searchItems(item: String) {
        presenter?.searchProducts(name: item)
    }
    
    func selectItem() {
        // TODO
    }
    
    func presentLoader() {
        // TODO
    }
    
    func hideLoader() {
        // TODO
    }
    
    func showError(error: String) {
        print("DESDE LA VISTA \(error)")
        
    }

}

extension SearchViewController: SearchPresenterOutputProtocol {
    func didRetrieveProducts(products: [ProductModel]) {
        self.products = products
        print("LLEGARON \(products.count)")
        hideLoader()
    }
    
    func didRetrievedError(error: String) {
        showError(error: error)
    }
    
}
