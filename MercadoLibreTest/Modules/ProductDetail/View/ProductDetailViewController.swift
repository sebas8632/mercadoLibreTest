//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 15/05/21.
//

import UIKit
import SkeletonView

class ProductDetailViewController: UIViewController, ProductDetailViewProtocol {
  
    unowned var productDetailView: ProductDetailView { return self.view as! ProductDetailView }
    unowned var name: UILabel { return productDetailView.productName }
    unowned var state: UILabel { return productDetailView.productState }
    unowned var image: UIImageView { return productDetailView.productImage }
    unowned var price: UILabel { return productDetailView.productPrice }
    unowned var installments: UILabel { return productDetailView.productInstallments }
    unowned var stockValue: UILabel { return productDetailView.stockValue }
    unowned var ubication: UILabel { return productDetailView.ubicationValue }
    unowned var stackPrice: UIStackView { return productDetailView.stackPrice }
    unowned var stackStock: UIStackView { return productDetailView.stackStock }
    unowned var stackInfo: UIStackView { return productDetailView.stackInfo }
    unowned var stockMessage: UILabel { return productDetailView.stockMessage}
    unowned var infoMessage: UILabel { return productDetailView.infoMessage}
    unowned var ubicationMessage: UILabel { return productDetailView.ubicationMessage}

    var presenter: ProductDetailPresenterInputProtocol?
    var product: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configurateSkeleton()
    }
    
    override func loadView() {
        view = ProductDetailView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.title = product?.name
        showSkeleton()
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
        view.showAnimatedSkeleton(usingColor: .skeletonDefault, animation: nil, transition: .crossDissolve(0.25))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.setupView()
            self?.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
        }    }
    
    private func configurateSkeleton() {
        productDetailView.isSkeletonable = true
        state.isSkeletonable = true
        name.isSkeletonable = true
        price.isSkeletonable = true
        installments.isSkeletonable = true
        stockValue.isSkeletonable = true
        ubication.isSkeletonable = true
        image.isSkeletonable = true
        stackPrice.isSkeletonable = true
        stackStock.isSkeletonable = true
        stackInfo.isSkeletonable = true
        infoMessage.isSkeletonable = true
        stockMessage.isSkeletonable = true
        ubicationMessage.isSkeletonable = true
        
    }
    
    private func setupNavigationBar() {
    
        navigationItem.title = product?.name
        navigationController?.navigationBar.tintColor = .black
        navigationItem.largeTitleDisplayMode = .never
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.yellow
    }
}
