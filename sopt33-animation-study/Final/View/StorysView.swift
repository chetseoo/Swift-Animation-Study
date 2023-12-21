//
//  StorysView.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 12/18/23.
//

import UIKit

final class StorysView: UIView {
    
    // MARK: set Properties
    
    private let newStoryView = StoryCircleView()
    private let dosoptStoryView = StoryCircleView()
    private let sanrioStoryView = StoryCircleView()
    
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
        newStoryView.do {
            $0.titleLabel.text = "새로 만들기"
            $0.circleImageView.image = UIImage(named: "Shape")
        }
        
        dosoptStoryView.do {
            $0.titleLabel.text = "dosopt_iOS"
            $0.circleImageView.image = UIImage(named: "sopt")
        }
        
        sanrioStoryView.do {
            $0.titleLabel.text = "교동이를 사랑하자"
            $0.circleImageView.image = UIImage(named: "gyodongstory")
        }
    }
    
    //MARK: set Hierachy
    
    private func setHierachy() {
        
        self.addSubviews(newStoryView,
                              dosoptStoryView,
                              sanrioStoryView)
    }
    
    //MARK: set Layout
    
    private func setLayout() {
        newStoryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(14.adjusted)
        }
        
        dosoptStoryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(newStoryView.snp.trailing).offset(18.adjusted)
        }
        
        sanrioStoryView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(dosoptStoryView.snp.trailing).offset(18.adjusted)
        }
    }
}
