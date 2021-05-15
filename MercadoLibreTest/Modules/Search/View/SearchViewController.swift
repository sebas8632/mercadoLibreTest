//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import UIKit

class SearchViewController: UIViewController, SearchViewInputProtocol {
    
    unowned var searchView: SearchView { return self.view as! SearchView }
    unowned var searchBox: SearchBoxView { return searchView.searchBoxView }
    unowned var searchBar: UISearchBar { return searchBox.searchBar }
    unowned var tableView: UITableView { return searchView.tableView }
    unowned var waitView: UIView { return searchView.waitView }

    var presenter: SearchPresenterInputProtocol?
    
    lazy var products: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func loadView() {
        view = SearchView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupView() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.hidesBarsOnSwipe = true
        searchBar.delegate = self
        tableView.dataSource = self
    }
    
    func searchItems(item: String) {
        self.presenter?.searchProducts(name: item)
    }
    
    func selectItem() {
        // TODO
    }
    
    func presentLoader() {
        // TODO
    }
    
    func showError(error: String) {
        print("DESDE LA VISTA \(error)")
        
    }
    
}

extension SearchViewController: SearchPresenterOutputProtocol {
    func didRetrieveProducts(products: [ProductModel]) {
        self.products = products
        tableView.reloadData()
        
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.waitView.alpha = 0
        }) { _ in
            self.waitView.isHidden = true
            self.tableView.isHidden = false
        }        
    }
    
    func didRetrievedError(error: String) {
        showError(error: error)
    }
    
}

// MARK: SEARCH BAR DELEGATE

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let search: String = searchBar.text ?? ""
        searchBar.resignFirstResponder()
        searchItems(item: search)
    }
}

// MARK: TABLE VIEW DATA SOURCE
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProducTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        
        cell.product = ProductModel(identifier: product.identifier,
                                    siteId: product.siteId,
                                    name: product.name,
                                    price: product.price,
                                    currency: product.currency,
                                    address: product.address,
                                    attributes: product.attributes,
                                    condition: product.condition,
                                    thumbnail: product.thumbnail)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
