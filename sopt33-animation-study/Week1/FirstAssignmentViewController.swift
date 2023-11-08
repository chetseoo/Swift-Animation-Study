//
//  FirstAssignmentViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/8/23.
//

import UIKit

final class FirstAssignmentViewController: UIViewController {
    
    private var shakeButton: UIButton?
    private var toastButton: UIButton?
    private var aaButton: UIButton?
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hangyodon")
        view.frame = CGRect(x: 50, y: 900, width: 300, height: 200)
        return view
    }()
    
    private func createButton(title: String, positionY: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: 100, y: positionY, width: 200, height: 50))
        button.setTitle(title, for: .normal)
        button.layer.backgroundColor = UIColor.systemPink.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 15
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTapEvent()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setLayout() {
        self.view.backgroundColor = .systemGray2
        shakeButton = createButton(title: "흔들흔들🫨", positionY: 250)
        toastButton = createButton(title: "교동이토스트🥪", positionY: 350)
        aaButton = createButton(title: "아무거나🤩", positionY: 450)
        self.view.addSubview(shakeButton!)
        self.view.addSubview(toastButton!)
        self.view.addSubview(aaButton!)
        self.view.addSubview(imageView)
    }
    
    private func setTapEvent() {
        shakeButton?.addTarget(self, action: #selector(shakeTap), for: .touchUpInside)
        toastButton?.addTarget(self, action: #selector(toastTap), for: .touchUpInside)
    }
    
    // 1. 흔들리는 버튼
    @objc private func shakeTap() {
        shakeButton?.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2,
                       options: [.curveEaseInOut]) { [self] in
            shakeButton?.transform = .identity
        }
    }
    
    // 2. 토스트 메세지
    @objc private func toastTap() {
        UIView.animate(withDuration: 2.0, delay: 0.0, animations: { [self] in
            imageView.frame.origin.y -= 300
        }, completion: { [self]_ in
            UIView.animate(withDuration: 1.5, animations: { [self] in
                imageView.alpha = 0.0
            })
        })
        
    }
}
