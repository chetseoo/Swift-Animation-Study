//
//  UIStackView+.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
