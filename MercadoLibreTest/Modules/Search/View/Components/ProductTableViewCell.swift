//
//  ProductTableViewCell.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 14/05/21.
//

import Foundation
import UIKit
import JSFSUIModule
import Kingfisher
class ProductTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var product: ProductModel? {
        didSet {
            productTitle.text = product?.name
            productPrice.text = product?.price.getCurrency()
            productCity.text = product?.address.city
            productState.text = " - \(product?.address.state ?? "")"
            
            productThumbnail.setImageFrom(url: product?.thumbnail ?? "https://s.pngix.com/pngfile/s/648-6482591_mercadolibre-logo-logo-de-mercado-libre-en-png.png")
        }
    }
    
     lazy var productTitle: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var productCity: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    private lazy var productState: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    private lazy var productThumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
}

extension ProductTableViewCell {
    
    private func setUpUI() {
        addSubViewsAndActiveAutoLayout([
            productTitle,
            productPrice,
            productThumbnail,
            productCity,
            productState
        ])
    }
    
    private func setUpConstraints() {
        productThumbnailConstraint()
        productTitleConstraint()
        productPriceConstraint()
        productCityConstraint()
        productStateConstraint()
    }

    private func productThumbnailConstraint() {
        productThumbnail.setSizeImageEqually(80)
        NSLayoutConstraint.activate([
            productThumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimensions.Margin.small),
            productThumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Dimensions.NegativeMargin.small),
            productThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimensions.Margin.small)
        ])
    }
    
    private func productTitleConstraint() {
        NSLayoutConstraint.activate([
            productTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimensions.Margin.medium),
            productTitle.leadingAnchor.constraint(equalTo: productThumbnail.trailingAnchor, constant: Dimensions.Margin.small),
            productTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.NegativeMargin.small)
        ])
    }
    
    private func productPriceConstraint() {
        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: Dimensions.Margin.small),
            productPrice.leadingAnchor.constraint(equalTo: productThumbnail.trailingAnchor, constant: Dimensions.Margin.small),
            productPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Dimensions.NegativeMargin.small)
        ])
    }
    
    private func productCityConstraint() {
        NSLayoutConstraint.activate([
            productCity.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: Dimensions.Margin.small),
            productCity.leadingAnchor.constraint(equalTo: productThumbnail.trailingAnchor, constant: Dimensions.Margin.small)
        ])
    }
    
    private func productStateConstraint() {
        NSLayoutConstraint.activate([
            productState.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: Dimensions.Margin.small),
            productState.leadingAnchor.constraint(equalTo: productCity.trailingAnchor, constant: Dimensions.Margin.xSmall)
        ])
    }
    
}
