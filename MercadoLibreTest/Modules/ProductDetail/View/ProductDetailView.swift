//
//  ProductDetailView.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import Foundation
import UIKit
import JSFSUIModule

class ProductDetailView: UIView {
   
    required init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.white
        addSubViewsAndActiveAutoLayout([
            productState,
            productName,
            productImage,
            stackPrice,
            stackStock,
            stackInfo
        ])
        stackPrice.addArrangedSubview(productPrice)
        stackPrice.addArrangedSubview(productInstallments)
        stackStock.addArrangedSubview(stockMessage)
        stackStock.addArrangedSubview(stockValue)
        stackInfo.addArrangedSubview(infoMessage)
        stackInfo.addArrangedSubview(ubicationMessage)
        stackInfo.addArrangedSubview(ubicationValue)

    }
    
    private func setupConstraints() {
        let margins: UILayoutGuide = safeAreaLayoutGuide
        productStateConstraint(margins: margins)
        productNameConstraint()
        productImageConstraint()
        productImageConstraint()
        stackPriceConstraint()
        stackStockConstraint()
        stackInfoConstraint()
    }
    
    private func productStateConstraint(margins: UILayoutGuide) {
        NSLayoutConstraint.activate([
            productState.topAnchor.constraint(equalTo: margins.topAnchor, constant: Dimensions.Margin.medium),
            productState.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            productState.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)
        ])
    }
    
    private func productNameConstraint() {
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: productState.bottomAnchor, constant: Dimensions.Margin.small),
            productName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            productName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)
        ])
    }
    
    private func productImageConstraint() {
        productImage.setSizeImage(width: 200, height: 200)
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: Dimensions.Margin.medium),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)
        ])
    }
    
    private func stackPriceConstraint() {
        NSLayoutConstraint.activate([
            stackPrice.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: Dimensions.Margin.medium),
            stackPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            stackPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)
        ])
    }
    
    private func stackStockConstraint() {
        NSLayoutConstraint.activate([
            stackStock.topAnchor.constraint(equalTo: stackPrice.bottomAnchor, constant: Dimensions.Margin.medium),
            stackStock.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            stackStock.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)
        ])
    }
    
    private func stackInfoConstraint() {
        NSLayoutConstraint.activate([
            stackInfo.topAnchor.constraint(equalTo: stackStock.bottomAnchor, constant: Dimensions.Margin.large),
            stackInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Dimensions.Margin.medium),
            stackInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Dimensions.NegativeMargin.medium)

        ])
    }
    
    lazy var productState: UILabel = {
        let label = UILabel()
        label.text = "Nuevo | 0 vendidos"
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var productName: UILabel = {
        let label = UILabel()
        label.text = "Jetta GLI 2014"
        label.numberOfLines = 3
        label.font = UIFont(name: "Avenir", size: 16)
        
        return label
    }()
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mercadoLibre")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var productPrice: UILabel = {
        let label = UILabel()
        label.text = "$ 40.000.000"
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir", size: 32)
        
        return label
    }()
    
    lazy var productInstallments: UILabel = {
        let label = UILabel()
        label.text = "en 35 cuotas de 100000"
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir", size: 12)
        return label
    }()
    
    lazy var stockMessage: UILabel = {
        let label = UILabel()
        label.text = LocalizablesMercadoLibre.ProductDetail.stockAvailable
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir-Black", size: 16)

        return label
    }()
    
    lazy var stockValue: UILabel = {
        let label = UILabel()
        label.text = "5 disponibles"
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var infoMessage: UILabel = {
        let label = UILabel()
        label.text = LocalizablesMercadoLibre.ProductDetail.infoSeller
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir", size: 20)

        return label
    }()
    
    lazy var ubicationMessage: UILabel = {
        let label = UILabel()
        label.text = LocalizablesMercadoLibre.ProductDetail.ubication
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir-Black", size: 16)

        return label
    }()
    
    lazy var ubicationValue: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .lightGray
        label.text = "Calarcá, Quindío"

        return label
    }()
    
    lazy var stackPrice: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var stackStock: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var stackInfo: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
}
