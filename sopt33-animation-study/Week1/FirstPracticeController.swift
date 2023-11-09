//
//  FirstPracticeViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/8/23.
//

import UIKit

final class FirstPracticeViewController: UIViewController {
    
    private let testView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .systemPurple
        return view
    }()
    
    private let testButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 50))
        button.setTitle("나타나라 얍^^✨", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(setTransition), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //self.setAnimation()
        //self.modifyAnimation()
        //self.springAnimation()
        self.springWithDampingAnimation()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(testView)
        self.view.addSubview(testButton)
    }
    
    private func setAnimation() {
        // 기본 Animation
        // 이렇게 선언하면 모든 애니메이션이 적용 안됨!
        UIView.animate(withDuration: 2.0, animations: {
            self.testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        })
        UIView.animate(withDuration: 2.0, animations: { [self] in
            testView.transform = CGAffineTransform(rotationAngle: .pi)
        })
        UIView.animate(withDuration: 2.0, animations: { [self] in
            testView.transform = CGAffineTransform(translationX: 200, y: 200)
        })
        
        // Animation Combine
        // 선언한 모든 애니메이션이 적용됨!
        UIView.animate(withDuration: 2.0, animations: { [self] in
            let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
            let rotate = CGAffineTransform(rotationAngle: .pi)
            let translate = CGAffineTransform(translationX: 200, y: 200)
            
            let concatenate = scale.concatenating(rotate).concatenating(translate)
            testView.transform = concatenate
        })
        
        // Animation 순차처리 - 1
        // 1. completion을 이용해보기 -> but 코드가 더러움이슈 ..,,
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        } completion: { _ in
            UIView.animate(withDuration: 2.0) { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            } completion: { _ in
                UIView.animate(withDuration: 2.0) { [self] in
                    testView.transform = CGAffineTransform(translationX: 200, y: 200)
                }
            }
        }
        
        // Animation 순차처리 - 2
        // 2. animateKeyframes를 이용해보기
        UIView.animateKeyframes(withDuration: 3.0, delay: 1.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: { [self] in
                testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 2/3, animations: { [self] in
                testView.transform = CGAffineTransform(translationX: 200, y: 200)
            })
        })
    }
    
    // transtition
    @objc
    private func setTransition() {
        UIView.transition(with: testView, duration: 0.6, options: .transitionCurlUp, animations: nil)
    }
    
    // modifyAnimation
    private func modifyAnimation() {
        UIView.animate(withDuration: 2.0, animations: { [self] in
            UIView.modifyAnimations(withRepeatCount: 4, autoreverses: false, animations: {
                testView.frame.origin.x += 100
                testView.frame.origin.y -= 50
            })
        })
    }
    
    // springDuration with Animation
    private func springAnimation() {
        UIView.animate(springDuration: 1.5, bounce: 0.7, animations: {
            testView.center.y += 120
        })
    }
    
    // spring -> usingSpringWithDamping
    private func springWithDampingAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, animations: { [self] in
            testView.center.y += 120
        })
    }
    
}

