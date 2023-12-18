//
//  AccountsNumberView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

import SnapKit
import Then

final class AccountsNumberView: UIView {
    
    // MARK: set Properties
    var numberLabel = UILabel()
    var descriptionLabel = UILabel()
    
    //MARK: Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    //MARK: set UI
    
    private func setUI() {
        
        numberLabel.do {
            $0.font = .systemFont(ofSize: 16.adjusted, weight: .semibold)
        }
        
        descriptionLabel.do {
            $0.font = .systemFont(ofSize: 13.adjusted, weight: .regular)
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.addSubviews(numberLabel, descriptionLabel)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        
        numberLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(numberLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}
