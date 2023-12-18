//
//  HeaderView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

final class HeaderView: UIView {
    
    // MARK: set Properties
    
    private let userNameLabel = UILabel()
    private let accountListImage = UIImageView()
    
    private let plusButton = UIButton()
    private let menuButton = UIButton()
    
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
        plusButton.do {
            $0.setImage(UIImage(named: "plus"), for: .normal)
        }
        
        menuButton.do {
            $0.setImage(UIImage(named: "menu"), for: .normal)
        }
        
        userNameLabel.do {
            $0.text = "dosopt_seoyeon"
            $0.font = .systemFont(ofSize: 21.adjusted, weight: .black)
        }
        
        accountListImage.do {
            $0.image = UIImage(named: "accountsList")
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.addSubviews(plusButton, menuButton, userNameLabel, accountListImage)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        menuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18.adjusted)
            $0.top.equalToSuperview().inset(13.adjusted)
        }
        
        plusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(60.adjusted)
            $0.top.equalTo(menuButton.snp.top)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.adjusted)
            $0.top.equalToSuperview().inset(16.adjusted)
        }
        
        accountListImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.adjusted)
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(5.adjusted)
        }
    }
}
