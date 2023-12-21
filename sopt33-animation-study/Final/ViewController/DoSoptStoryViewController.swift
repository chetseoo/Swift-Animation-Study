//
//  DoSoptStoryViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/22/23.
//

import UIKit

import SnapKit
import Then

final class DoSoptStoryViewController: UIViewController {
    
    //MARK: set Properties
    
    private let storyprofileImageView = UIImageView()
    private let storyTitleLabel = UILabel()
    private let storyDateLabel = UILabel()
    private let closeButton = UIButton()
    
    private let iosImageView = UIImageView()
    
    private let storyTabbarImageView = UIImageView()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierachy()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: set UI
    
    private func setUI() {
        
        storyprofileImageView.do {
            $0.image = UIImage(named: "dosoptstoryimage")
        }
        
        storyTitleLabel.do {
            $0.text = "dosopt_iOS"
            $0.font = .systemFont(ofSize: 13.adjusted, weight: .semibold)
            $0.textColor = .white
        }
        
        storyDateLabel.do {
            $0.text = "2023년 12월 23일"
            $0.font = .systemFont(ofSize: 12.adjusted, weight: .regular)
            $0.textColor = .white
        }
        
        closeButton.do {
            $0.setImage(UIImage(named: "close"), for: .normal)
            $0.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        }
        
        iosImageView.do {
            $0.image = UIImage(named: "iosstory")
        }
        
        storyTabbarImageView.do {
            $0.image = UIImage(named: "storyTabbar")
        }
    }
    
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(iosImageView,
                              storyTabbarImageView)
        
        iosImageView.addSubviews(storyprofileImageView,
                                 storyTitleLabel,
                                 storyDateLabel,
                                 closeButton)
    }
    
    
    //MARK: set Layout
    
    private func setLayout() {
        
        storyprofileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        storyTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.adjusted)
            $0.leading.equalTo(storyprofileImageView.snp.trailing).offset(12.adjusted)
        }
        
        storyDateLabel.snp.makeConstraints {
            $0.top.equalTo(storyTitleLabel.snp.top)
            $0.leading.equalTo(storyTitleLabel.snp.trailing).offset(8.adjusted)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.adjusted)
            $0.trailing.equalToSuperview().inset(11.adjusted)
        }
        
        iosImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.bottom.equalTo(storyTabbarImageView.snp.top)
        }
        
        storyTabbarImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(78.adjusted)
        }
    }
    
    //MARK: Methods
    
    @objc
    private func closeButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}
