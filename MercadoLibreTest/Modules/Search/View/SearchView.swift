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
        addSubViewsAndActiveAutoLayout([contentView])
        
    }
    
    private func setupConstraints() {
        let margins: UILayoutGuide = layoutMarginsGuide
        contentView.fullConstraintViewSafeArea(margins, 0)
    }
    
    // MARK: Components
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.yellow

        return view
    }()
}
