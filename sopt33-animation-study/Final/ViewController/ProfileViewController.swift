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
    
    private let profileView = ProfileView()
    
    private let newStoryView = StoryCircleView()
    private let dosoptStoryView = StoryCircleView()
    private let sanrioStoryView = StoryCircleView()
    
    private let tabsImageView = UIImageView()
    private let tabbarImageView = UIImageView()
    
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
        
        newStoryView.do {
            $0.titleLabel.text = "새로 만들기"
            $0.circleImageView.image = UIImage(named: "Shape")
        }
        
        dosoptStoryView.do {
            $0.titleLabel.text = "dosopt_iOS"
            $0.circleImageView.image = UIImage(named: "sopt")

            $0.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dosoptStoryViewTapped))
            $0.addGestureRecognizer(tapGesture)
        }
        
        sanrioStoryView.do {
            $0.titleLabel.text = "교동이를 사랑하자"
            $0.circleImageView.image = UIImage(named: "gyodongstory")
            
            $0.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(gyodonStoryViewTapped))
            $0.addGestureRecognizer(tapGesture)
        }
        
        tabsImageView.do {
            $0.image = UIImage(named: "Tabs")
        }
        
        tabbarImageView.do {
            $0.image = UIImage(named: "Tab Bar")
        }
    }
    
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(headerView,
                              profileView,
                              newStoryView,
                              dosoptStoryView,
                              sanrioStoryView,
                              tabsImageView,
                              tabbarImageView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.height.equalTo(59.adjusted)
        }
        
        profileView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(180.adjusted)
        }
        
        newStoryView.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom)
            $0.leading.equalToSuperview().inset(14.adjusted)
        }
        
        dosoptStoryView.snp.makeConstraints {
            $0.top.equalTo(newStoryView.snp.top)
            $0.leading.equalTo(newStoryView.snp.trailing).offset(18.adjusted)
        }
        
        sanrioStoryView.snp.makeConstraints {
            $0.top.equalTo(newStoryView.snp.top)
            $0.leading.equalTo(dosoptStoryView.snp.trailing).offset(18.adjusted)
        }
        
        tabsImageView.snp.makeConstraints {
            $0.top.equalTo(newStoryView.snp.bottom).offset(20.adjusted)
            $0.leading.trailing.equalToSuperview()
        }
        
        tabbarImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    //MARK: Methods
    
    @objc
    private func dosoptStoryViewTapped(sender: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(DoSoptStoryViewController(), animated: false)
    }
    
    @objc
    private func gyodonStoryViewTapped(sender: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(GyodonStoryViewController(), animated: false)
    }
}
