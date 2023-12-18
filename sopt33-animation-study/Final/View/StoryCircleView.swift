//
//  StoryCircleView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

final class StoryCircleView: UIView {
    
    // MARK: set Properties
    
    let circleImageView = UIImageView()
    private let circleBorder = UIImageView()
    let titleLabel = UILabel()
    
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
    
        circleBorder.do {
            $0.image = UIImage(named: "smallOval")
        }
        
        circleImageView.do {
            $0.image = UIImage(named: "sport")
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 12.adjusted, weight: .regular)
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.addSubviews(circleBorder, titleLabel)
        circleBorder.addSubview(circleImageView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        
        circleImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        circleBorder.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.size.equalTo(64.adjusted)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(circleBorder.snp.bottom).offset(3.adjusted)
            $0.centerX.equalTo(circleBorder.snp.centerX)
        }
        
        self.snp.makeConstraints {
            $0.width.equalTo(circleBorder.snp.width)
        }
    }
}
