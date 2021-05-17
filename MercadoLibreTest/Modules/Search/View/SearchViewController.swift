//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import UIKit
import JSFSPopUps
class SearchViewController: UIViewController, SearchViewInputProtocol {
    
    unowned var searchView: SearchView { return self.view as! SearchView }
    unowned var tableView: UITableView { return searchView.tableView }
    unowned var waitView: UIView { return searchView.waitView }
    
    var searchController: UISearchController?
    var presenter: SearchPresenterInputProtocol?
    lazy var products: [ProductModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController()
        navigationItem.searchController = searchController
        setupView()
    }
    
    override func loadView() {
        view = SearchView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupView() {
        searchController?.searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = LocalizablesMercadoLibre.SearchStrings.search
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.yellow
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    private func setupSearchController() {
        searchController?.hidesNavigationBarDuringPresentation = false

        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = LocalizablesMercadoLibre.SearchStrings.searchMercadoLibre
        searchController?.searchBar.searchBarStyle = .default
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.backgroundImage = UIImage()
        searchController?.searchBar.searchTextField.backgroundColor = .white
        searchController?.searchBar.setValue(LocalizablesMercadoLibre.SearchStrings.cancel, forKey: "cancelButtonText")
    }
    
    func searchItems(item: String) {
        self.presenter?.searchProducts(name: item)

    }
    
    func selectItem(product: ProductModel) {
        presenter?.goToProductDetail(from: self, product: product)
    }
    
    func showError(error: String) {
        PopUpManager.showError(error: error, from: navigationController!)
    }
    
}

extension SearchViewController: SearchPresenterOutputProtocol {
    func didRetrieveProducts(products: [ProductModel]) {
        self.products = products
        tableView.reloadData()
        
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
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
        
        cell.product = product
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product: ProductModel = products[indexPath.row]
        selectItem(product: product)
    }
}
