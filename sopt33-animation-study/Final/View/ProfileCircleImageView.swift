//
//  ProfileCircleImageView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

import SnapKit
import Then

final class ProfileCircleImageView: UIView {
    
    // MARK: set Properties
    private let circleBorder = UIImageView()
    private let profileImageView = UIImageView()
    
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
            $0.image = UIImage(named: "oval")
        }
        profileImageView.do {
            $0.image = UIImage(named: "profileImage")
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.addSubview(circleBorder)
        circleBorder.addSubview(profileImageView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        
        profileImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        circleBorder.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.snp.makeConstraints {
            $0.size.equalTo(circleBorder.snp.size)
        }
    }
}
