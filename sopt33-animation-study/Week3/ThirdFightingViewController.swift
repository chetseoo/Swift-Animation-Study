//
//  ThirdFightingViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class ThirdFightingViewController: UIViewController {
    
    //MARK: set Properties
    private let loadingIndicator =  LoadingIndicator(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let loadingIndicator = LoadingIndicator(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
                loadingIndicator.startAnimation()
                
                self.view.addSubview(loadingIndicator)
    }
    
    //MARK: - set UI
    
    private func setUI() {
        
    }
    
    //MARK: - set Hierachy
    
    private func setHierachy() {
        
    }
    
    //MARK: - set Layout
    
    private func setLayout() {
        
    }
    
}

class LoadingIndicator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUI() {
        backgroundColor = .systemGray5
        clipsToBounds = true
        layer.cornerRadius = frame.width/2
    }
    
    private lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 5
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = .round
        layer.frame = bounds
        return layer
    }()
    
    private lazy var circlePath: UIBezierPath = {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let path = UIBezierPath(arcCenter: center,
                                radius: bounds.width/2*2/3,
                                startAngle: .pi/2,
                                endAngle: Double.pi - .pi/2,
                                clockwise: true)
        return path
    }()
    
    override func draw(_ rect: CGRect) {
        backgroundLayer.path = circlePath.cgPath
        indicatorLayer.path = circlePath.cgPath
        
        layer.addSublayer(indicatorLayer)
        layer.addSublayer(backgroundLayer)
    }
    
    private lazy var indicatorLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 5
        layer.lineCap = .round
        layer.frame = bounds
        // 이 부분을 이용해서 끝을 잘라주었어요!
        layer.strokeEnd = 0.35
        return layer
    }()
    func startAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = Double.pi
        
        rotationAnimation.duration = 2
        rotationAnimation.repeatCount = HUGE
        
        indicatorLayer.add(rotationAnimation, forKey: "rotate")
    }
    
    func cancelAnimation() {
        layer.sublayers?.forEach { layer in
            layer.removeAllAnimations()
            layer.removeFromSuperlayer()
        }
    }
}
