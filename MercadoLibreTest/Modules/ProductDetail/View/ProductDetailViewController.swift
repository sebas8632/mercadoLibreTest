//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import UIKit

class ProductDetailViewController: UIViewController, ProductDetailViewProtocol {
  
    unowned var productDetailView: ProductDetailView { return self.view as! ProductDetailView }
    unowned var name: UILabel { return productDetailView.productName }
    unowned var state: UILabel { return productDetailView.productState }
    unowned var image: UIImageView { return productDetailView.productImage }
    unowned var price: UILabel { return productDetailView.productPrice }
    unowned var installments: UILabel { return productDetailView.productInstallments }
    unowned var stockValue: UILabel { return productDetailView.stockValue }
    unowned var ubication: UILabel { return productDetailView.ubicationValue }

    var presenter: ProductDetailPresenterInputProtocol?
    var product: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func loadView() {
        view = ProductDetailView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.title = product?.name
        setupView()
    }
    
    func setupView() {
        
        guard let product = self.product else { return }
        name.text = product.name
        state.text = presenter?.getState(product: product)
        price.text = product.price.getCurrency()
        installments.text = presenter?.getInstallments(product: product)
        stockValue.text = presenter?.getStockMessage(product: product)
        ubication.text = presenter?.getUbication(product: product)
        image.setImageFrom(url: product.thumbnail)
    }
    
    func showSkeleton() {
        // TODO
    }
    
    private func setupNavigationBar() {
    
        navigationItem.title = product?.name
        navigationController?.navigationBar.tintColor = .black
        navigationItem.largeTitleDisplayMode = .never
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.yellow
    }
    
}

extension ProductDetailViewController: ProductDetailPresenterOutputProtocol {
    func hideSkeleton() {
        // TODO
    }
}
