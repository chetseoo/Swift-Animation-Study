//
//  ProfileViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

import SnapKit
import Then

final class ProfileViewController: UIViewController {
    
    //MARK: set Properties
    
    private let headerView = HeaderView()
    private let scrollView = UIScrollView()
    
    private let circleProfileView = ProfileCircleImageView()
    private let postNumberView = AccountsNumberView()
    private let followersNumberView = AccountsNumberView()
    private let followingNumberView = AccountsNumberView()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    //MARK: set UI
    
    private func setUI() {
        self.view.do {
            $0.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
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
        self.view.addSubviews(headerView, scrollView)
        
        scrollView.addSubviews(circleProfileView,
                               postNumberView,
                               followersNumberView,
                               followingNumberView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.height.equalTo(59.adjusted)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1000.adjusted)
        }
        
        circleProfileView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(11.adjusted)
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
