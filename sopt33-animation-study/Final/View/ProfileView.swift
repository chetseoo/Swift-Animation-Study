//
//  ProfileView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

final class ProfileView: UIView {
    
    // MARK: set Properties
    
    private let circleProfileView = ProfileCircleImageView()
    private let userNameLabel = UILabel()
    private let userDescriptionLabel = UILabel()
    
    private let postNumberView = AccountsNumberView()
    private let followersNumberView = AccountsNumberView()
    private let followingNumberView = AccountsNumberView()
    
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
        
        userNameLabel.do {
            $0.text = "최서연"
            $0.font = .systemFont(ofSize: 12.adjusted, weight: .semibold)
        }
        
        userDescriptionLabel.do {
            $0.text = "안녕하세요! 두솝 iOS YB 최서연입니다.\n여러분과 함께 할 수 있어서 영광이었습니다💝 \n오래 봐요 사랑해 앱잼 화이팅😍💘"
            $0.numberOfLines = 3
            $0.font = .systemFont(ofSize: 12.adjusted, weight: .regular)
        }
        
        postNumberView.do {
            $0.numberLabel.text = "1"
            $0.descriptionLabel.text = "게시"
        }
        
        followersNumberView.do {
            $0.numberLabel.text = "347"
            $0.descriptionLabel.text = "팔로워"
        }
        
        followingNumberView.do {
            $0.numberLabel.text = "123"
            $0.descriptionLabel.text = "팔로우"
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.addSubviews(circleProfileView,
                         userNameLabel,
                         userDescriptionLabel)
        
        self.addSubviews(postNumberView,
                         followersNumberView,
                         followingNumberView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        
        circleProfileView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(11.adjusted)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(circleProfileView.snp.bottom).offset(12.adjusted)
            $0.leading.equalToSuperview().inset(18.adjusted)
        }
        
        userDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom)
            $0.leading.equalTo(userNameLabel.snp.leading)
            $0.width.equalTo(290.adjusted)
        }
        
        postNumberView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.adjusted)
            $0.leading.equalTo(circleProfileView.snp.trailing).offset(50.adjusted)
        }
        
        followersNumberView.snp.makeConstraints {
            $0.top.equalTo(postNumberView.snp.top)
            $0.leading.equalTo(postNumberView.snp.trailing).offset(50.adjusted)
        }
        
        followingNumberView.snp.makeConstraints {
            $0.top.equalTo(postNumberView.snp.top)
            $0.leading.equalTo(followersNumberView.snp.trailing).offset(50.adjusted)
        }
    }
}
