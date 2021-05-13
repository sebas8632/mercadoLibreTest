//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import UIKit

class SearchViewController: UIViewController, SearchViewInputProtocol {
    var presenter: SearchPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = SearchView()
    }
    
    func setupView() {
        // TODO
    }
    
    func searchItems() {
        // TODO
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

}

extension SearchViewController: SearchPresenterOutputProtocol {
    
}
