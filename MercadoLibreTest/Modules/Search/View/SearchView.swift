//
//  SearchView.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 12/05/21.
//

import Foundation
import UIKit
import JSFSUIModule

class SearchView: UIView {
    
    required init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.white
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProducTableViewCell")
        
        addSubViewsAndActiveAutoLayout([contentView])
        contentView.addSubViewsAndActiveAutoLayout([tableView, waitView])
        waitView.addSubViewsAndActiveAutoLayout([waitImage])
        tableView.isHidden = true
    }
    
    private func setupConstraints() {
        let margins: UILayoutGuide = safeAreaLayoutGuide
        contentViewConstraint(margins: margins)
        tableViewConstraint(margins: margins)
        waitViewConstraint(margins: margins)
        waitImageConstraint()
    }
    
    // MARK: CONSTRAINTS
    
    private func contentViewConstraint(margins: UILayoutGuide) {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: margins.topAnchor, constant: Dimensions.zero),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.zero),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.zero),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Dimensions.zero)
        ])
    }
    
    private func tableViewConstraint(margins: UILayoutGuide) {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: Dimensions.Margin.medium),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Dimensions.NegativeMargin.medium),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.zero),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.zero)
        ])
    }
    
    private func waitViewConstraint(margins: UILayoutGuide) {
        NSLayoutConstraint.activate([
            waitView.topAnchor.constraint(equalTo: margins.topAnchor, constant: Dimensions.Margin.medium),
            waitView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Dimensions.NegativeMargin.medium),
            waitView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.zero),
            waitView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.zero)
        ])
    }
    private func waitImageConstraint() {
        waitImage.setSizeImage(width: 200, height: 200)
        NSLayoutConstraint.activate([
            waitImage.centerXAnchor.constraint(equalTo: waitView.centerXAnchor),
            waitImage.centerYAnchor.constraint(equalTo: waitView.centerYAnchor)
        ])
    }
    
    // MARK: Components
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    lazy var waitView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var waitImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mercadoLibre")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.sizeToFit()
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
}
