//
//  SecondFightingViewController.swift
//  sopt33-animation-study
//
//  Created by 최서연 on 11/15/23.
//

import UIKit
import SnapKit

final class SecondFightingViewController: UIViewController {
    
    //MARK: - setting Property
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please Save Gyodon!"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let startButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start!", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let gyodon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gyodon")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let leftTopMaru = UIImageView(image: UIImage(named: "maru"))
    private let rightTopMaru = UIImageView(image: UIImage(named: "maru"))
    private let leftMiddleMaru = UIImageView(image: UIImage(named: "maru"))
    private let rightMiddleMaru = UIImageView(image: UIImage(named: "maru"))
    private let leftBottomMaru = UIImageView(image: UIImage(named: "maru"))
    private let rightBottomMaru = UIImageView(image: UIImage(named: "maru"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    // MARK: - setting UI
    
    private func setUI() {
        self.view.backgroundColor = .white
        self.setHierarchy()
        self.setLayout()
        
    }
    
    // MARK: - setting layout
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
        startButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
        }
        gyodon.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(400)
            $0.width.equalTo(130)
            $0.height.equalTo(130)
        }
        leftTopMaru.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().inset(170)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        rightTopMaru.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(170)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        leftMiddleMaru.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        rightMiddleMaru.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        leftBottomMaru.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(90)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        rightBottomMaru.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(90)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
    }
    
    // MARK: - setting hierarchy
    
    private func setHierarchy() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(startButton)
        self.view.addSubview(gyodon)
        [leftTopMaru, rightTopMaru, leftMiddleMaru, rightMiddleMaru, leftBottomMaru, rightBottomMaru].forEach {
            self.view.addSubview($0)
        }
    }
}
