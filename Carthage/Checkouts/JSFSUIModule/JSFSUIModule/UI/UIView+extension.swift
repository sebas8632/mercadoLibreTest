//
//  UIView+extension.swift
//  JSFSUIModule
//
//  Created by Juan Sebastian Florez Saavedra on 9/05/21.
//

import Foundation
import UIKit
extension UIView {

    public func addSubViewsAndActiveAutoLayout(_ subviews: [UIView]) {
        subviews.forEach(self.addSubviews)
    }

    public func addSubviews(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }

    public func fullconstraintView(_ view: UIView,
                                   _ verticalDimension: CGFloat = Dimensions.zero,
                                   _ horizontalDimension: CGFloat = Dimensions.zero) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalDimension),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 - horizontalDimension),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalDimension),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 - verticalDimension)
        ])
    }

    public func fullConstraintViewSafeArea(_ view: UILayoutGuide, _ dimension: CGFloat = 0) {
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dimension),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 - dimension),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: dimension),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 - dimension)
        ])
    }

    public func setSizeImageEqually(_ size: CGFloat) {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size)
        ])
    }
    public func setSizeImage(width: CGFloat, height: CGFloat) {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height),
            self.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    /*
    func displaySpinner() -> UIView {
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView.init(style: .large)
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            self.addSubview(spinnerView)
        }
        return spinnerView
    }
    func removeSpinner(spinner: UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
 */
}
