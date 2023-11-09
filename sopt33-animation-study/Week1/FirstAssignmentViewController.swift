//
//  FirstAssignmentViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/8/23.
//

import UIKit

final class FirstAssignmentViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        label.backgroundColor = UIColor(red: 236/255, green: 177/255, blue: 207/255, alpha: 1)
        
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.text = "애니메이션 스터디 화이팅 🍎🍏"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = UIColor(red: 75/255, green: 70/255, blue: 67/255, alpha: 1)
        return label
    }()
    
    private var shakeButton1: UIButton?
    private var shakeButton2: UIButton?
    private var toastButton: UIButton?
    private var labelButton: UIButton?
    
    private let imageView1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gyodon")
        view.frame = CGRect(x: 90, y: 900, width: 200, height: 200)
        return view
    }()
    
    private func createButton(title: String, positionY: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: 100, y: positionY, width: 200, height: 50))
        button.setTitle(title, for: .normal)
        button.layer.backgroundColor = UIColor(red: 70/255, green: 178/255, blue: 231/255, alpha: 1).cgColor
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 15
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTapEvent()
    }
    
    // 화면 UI
    private func setLayout() {
        self.view.backgroundColor = UIColor(red: 131/255, green: 204/255, blue: 210/255, alpha: 1)
        shakeButton1 = createButton(title: "좌우흔들🫨", positionY: 300)
        shakeButton2 = createButton(title: "위아래흔들🫨", positionY: 370)
        toastButton = createButton(title: "교동이토스트🥪", positionY: 440)
        labelButton = createButton(title: "화이팅👊🏼", positionY: 510)
        self.view.addSubview(titleLabel)
        self.view.addSubview(shakeButton1!)
        self.view.addSubview(shakeButton2!)
        self.view.addSubview(toastButton!)
        self.view.addSubview(labelButton!)
        self.view.addSubview(imageView1)
    }
    
    // 버튼 이벤트
    private func setTapEvent() {
        shakeButton1?.addTarget(self, action: #selector(shakeTap1), for: .touchUpInside)
        shakeButton2?.addTarget(self, action: #selector(shakeTap2), for: .touchUpInside)
        toastButton?.addTarget(self, action: #selector(toastTap), for: .touchUpInside)
        labelButton?.addTarget(self, action: #selector(postItTap), for: .touchUpInside)
    }
    
    // 1-1. 좌우로 흔들리는 버튼
    @objc private func shakeTap1() {
        shakeButton1?.transform = CGAffineTransform(translationX: 30, y: 0)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2,
                       options: [.curveEaseInOut]) { [self] in
            shakeButton1?.transform = .identity
        }
    }
    
    // 1-2. 위아래로 흔들리는 버튼
    @objc private func shakeTap2() {
        shakeButton2?.transform = CGAffineTransform(translationX: 0, y: 30)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.2,
                       options: [.curveEaseInOut]) { [self] in
            shakeButton2?.transform = .identity
        }
    }
    
    // 2. 교동이 토스트
    @objc private func toastTap() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2/8, animations: { [self] in
                imageView1.frame.origin.y -= 300
            })
            UIView.addKeyframe(withRelativeStartTime: 4/8, relativeDuration: 2/8, animations: { [self] in
                imageView1.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 6/8, relativeDuration: 1/8, animations: { [self] in
                imageView1.frame.origin.y = 900
            })
            UIView.addKeyframe(withRelativeStartTime: 7/8, relativeDuration: 1/8, animations: { [self] in
                imageView1.alpha = 1.0
            })
        })
    }
    
    // 3. titleLabel Animation
    @objc private func postItTap() {
        UIView.animate(withDuration: 1.5, animations: { [self] in
            let transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            let rotate = CGAffineTransform(rotationAngle: .pi)
            titleLabel.transform = transform.concatenating(rotate)
        }, completion: { [self]_ in
            titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
}
