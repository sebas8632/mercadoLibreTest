//
//  SearchBoxView.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 13/05/21.
//

import Foundation
import UIKit
import JSFSUIModule

class SearchBoxView: UIView {
    required init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubViewsAndActiveAutoLayout([searchBar])
        
    }
    
    private func setupConstraints() {
        searchBarConstraint()
    }
    
    // MARK: CONSTRAINTS
    
    private func searchBarConstraint() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimensions.zero),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.zero),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.zero)
        ])
    }
    
    // MARK: COMPONENTS
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.searchBarStyle = .default
        searchBar.sizeToFit()
        searchBar.barTintColor = .yellow
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
    
}
