//
//  GyodonStoryViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/22/23.
//

import UIKit

import SnapKit
import Then

final class GyodonStoryViewController: UIViewController {
    
    //MARK: set Properties
    
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
        
        self.view.do {
            $0.backgroundColor = .systemPink
        }
        
        storyTabbarImageView.do {
            $0.image = UIImage(named: "storyTabbar")
        }
    }
    
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubview(storyTabbarImageView)
    }
    
    
    //MARK: set Layout
    
    private func setLayout() {
        storyTabbarImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(78.adjusted)
        }
    }
}

