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
        
    }
    
    func searchItems() {
        
    }
    
    func selectItem() {
        
    }
    
    func presentLoader() {
        
    }
    
    func hideLoader() {
        
    }

}

extension SearchViewController: SearchPresenterOutputProtocol {
    
}
