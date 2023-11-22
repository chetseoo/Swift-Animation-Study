//
//  SecondPracticeController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/15/23.
//

import UIKit

class SecondPracticeController: UIViewController {
    private let testView: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 400, width: 150, height: 150))
        view.backgroundColor = .systemPurple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.target()
    }
    
    private func setUI() {
        self.view.backgroundColor = .red
        self.view.addSubview(testView)
    }
    
     private func target() {
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
         //tapGesture.numberOfTapsRequired = 3
         testView.addGestureRecognizer(tapGesture) // 뷰에 tapGesture 적용
         
         let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(viewPinched))
        testView.addGestureRecognizer(pinchGesture)
         
         let rotationGeuture = UIRotationGestureRecognizer(target: self, action: #selector(viewRotated))
         testView.addGestureRecognizer(rotationGeuture)
         
         let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(viewSwiped))
         rightGesture.direction = .right
         let letfGesture = UISwipeGestureRecognizer(target: self, action: #selector(viewSwiped))
         rightGesture.direction = .left
         
         self.view.addGestureRecognizer(rightGesture)
         self.view.addGestureRecognizer(letfGesture)
         
         let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(viewPressed))
         longPressGesture.minimumPressDuration = 3
         testView.addGestureRecognizer(longPressGesture)
         
         let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewPanned))
         testView.addGestureRecognizer(panGesture)
    }
    
    @objc func viewTapped(_ gesture: UITapGestureRecognizer) {
        print("🍎")
    }
    @objc func viewPinched(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view else { return }
        view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1 // 핀치를 그만두면 다시 원래상태로 돌아오도록 함
    }
    @objc func viewRotated(_ gesture: UIRotationGestureRecognizer) {
        guard let view = gesture.view else { return }
        view.transform = view.transform.rotated(by: gesture.rotation)
        gesture.rotation = 1
    }
    @objc func viewSwiped(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            self.view.backgroundColor = .systemMint
        }
        else if gesture.direction == .left {
            self.view.backgroundColor = .systemIndigo
        }
    }
    @objc func viewPressed(_ gesture: UILongPressGestureRecognizer) {
        // switch문을 이용해서 작성을 많이 한다. -> state값을 생각해서
        switch gesture.state {
        case .began: print("began\n")
        case .changed: print("changed\n")
        case .ended: print("ended\n")
        default: print("")
        }
    }
    @objc func viewPanned(_ gesture: UIPanGestureRecognizer) {
        let transition = gesture.translation(in: view)
        if let viewToMove = gesture.view {
            viewToMove.center = CGPoint(x: viewToMove.center.x+transition.x, y: viewToMove.center.y+transition.y)
        }
        gesture.setTranslation(.zero, in: view)
    }
}
