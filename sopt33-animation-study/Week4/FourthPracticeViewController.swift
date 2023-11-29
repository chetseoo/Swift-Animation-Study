//
//  FourthPracticeViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/29/23.
//

import UIKit

final class FourthPracticeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewToTransform = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        viewToTransform.backgroundColor = .red
        self.view.addSubview(viewToTransform)
        
        var transform = CATransform3DIdentity
        transform.m34 = -2.0 / 500
//        눈과 화면의 거리를 설정한 것!
//        그냥 쉽게 말해 눈과의 거리를 500일것이다라고 가정한 것이에용!
//        그러면 더 가까이 갈 수록 (수가 더 작아질 수록) 입체감이 더 커지겠죠 ?
        transform = CATransform3DRotate(transform, CGFloat(45 * Double.pi / 180), 0, 0, 1)
        viewToTransform.layer.transform = transform
    }
}
