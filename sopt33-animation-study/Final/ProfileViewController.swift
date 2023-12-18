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
    }
    
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(headerView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(44.adjusted)
            $0.height.equalTo(44.adjusted)
        }
    }
}