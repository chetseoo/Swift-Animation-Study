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
    
    private let progressBar = UIProgressView(progressViewStyle: .default)
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierachy()
        setLayout()
        
        setAnimation()
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
        
        progressBar.do {
            $0.trackTintColor = .white.withAlphaComponent(0.2)
            $0.progressTintColor = .white.withAlphaComponent(0.5)
            $0.progress = 0.1
            $0.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
            
        }
    }
    
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        self.view.addSubviews(iosImageView,
                              storyTabbarImageView)
        
        iosImageView.addSubviews(storyprofileImageView,
                                 storyTitleLabel,
                                 storyDateLabel,
                                 closeButton,
                                 progressBar)
    }
    
    
    //MARK: set Layout
    
    private func setLayout() {
        progressBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4.adjusted)
            $0.leading.equalToSuperview().inset(4.adjusted)
            $0.trailing.equalToSuperview().inset(4.adjusted)
        }
        
        storyprofileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13.adjusted)
            $0.leading.equalToSuperview().inset(10.adjusted)
        }
        
        storyTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21.adjusted)
            $0.leading.equalTo(storyprofileImageView.snp.trailing).offset(12.adjusted)
        }
        
        storyDateLabel.snp.makeConstraints {
            $0.top.equalTo(storyTitleLabel.snp.top)
            $0.leading.equalTo(storyTitleLabel.snp.trailing).offset(8.adjusted)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21.adjusted)
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
    
    
    private func setAnimation() {
        let heartEmitter = CAEmitterLayer()
        heartEmitter.emitterPosition = CGPoint(x: 50, y: view.bounds.height-120)
        heartEmitter.emitterSize = CGSize(width: 50, height: 100)
        heartEmitter.emitterShape = .circle
        
        let heartCell = CAEmitterCell()
        heartCell.contents = UIImage(named: "heart")?.cgImage
        heartCell.scale = 0.5
        heartCell.birthRate = 4
        heartCell.lifetime = 1.0
        heartCell.velocity = 80
        heartCell.emissionRange = .pi / 5
        heartCell.emissionLongitude = .pi / -2
        heartCell.alphaRange = 0.3
        heartCell.alphaSpeed = -0.5
        
        heartEmitter.emitterCells = [heartCell]
        view.layer.addSublayer(heartEmitter)
        
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.curveLinear], animations: {
            self.progressBar.frame.size.width = UIScreen.main.bounds.width-5
            self.progressBar.setProgress(1.0, animated: true)
        }, completion: { _ in
            self.navigationController?.pushViewController(ProfileViewController(), animated: false)
        })
    }
    
    @objc
    private func closeButtonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
}
