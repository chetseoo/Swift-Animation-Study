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
    
    var timer: Timer? = nil
    var runCount: Double = 0
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please Save Gyodon!"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Double Click Start!", for: .normal)
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
        self.setTarget()
    }
    
    // MARK: - setting UI
    
    private func setUI() {
        self.view.backgroundColor = .black
        
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
            $0.width.equalTo(200)
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
    
    //MARK: - setting Target
    
    private func setTarget() {
        //double click to start
        let doubleClickTapGesture = UITapGestureRecognizer(target: self, action: #selector(startButtonTapped))
        doubleClickTapGesture.numberOfTapsRequired = 2
        startButton.addGestureRecognizer(doubleClickTapGesture)
        
        // apply panGesture to gyodon
        let gyodonPanGesture = UIPanGestureRecognizer(target: self, action: #selector(gyodonPanned))
        gyodon.addGestureRecognizer(gyodonPanGesture)
        gyodon.isUserInteractionEnabled = true
    }
    
    private func startGame() {
        guard timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 0.2,
                                          target: self,
                                          selector: #selector(moveMaru),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    private func endGame() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    private func startButtonTapped(_ gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            self.titleLabel.text = "Please Save Gyodon!"
            
            // runCount값 초기화
            runCount = 0
            
            startGame()
        }
    }
    
    @objc
    private func gyodonPanned(_ gesture: UIPanGestureRecognizer) {
        let transition = gesture.translation(in: view)
        if let viewToMove = gesture.view {
            viewToMove.center = CGPoint(x: viewToMove.center.x+transition.x, y: viewToMove.center.y+transition.y)
        }
        gesture.setTranslation(.zero, in: view)
    }
    
    @objc
    private func moveMaru() {
        // 10초가 지나면 게임 성공
        if runCount >= 10.0 {
            self.titleLabel.text = "Success! Thank You~"
            self.endGame()
        }else {
            runCount += 0.2
        }
        
        var leftTopMaruX = self.leftTopMaru.frame.origin.x
        var leftTopMaruY = self.leftTopMaru.frame.origin.y
        leftTopMaruX += 10
        leftTopMaruY += 10
        self.leftTopMaru.frame = .init(origin: .init(x: leftTopMaruX, y: leftTopMaruY),
                                       size: self.leftTopMaru.frame.size)
        
        var leftMiddleMaruX = self.leftMiddleMaru.frame.origin.x
        var leftMiddleMaruY = self.leftMiddleMaru.frame.origin.y
        leftMiddleMaruX += 10
        leftMiddleMaruY -= 10
        self.leftMiddleMaru.frame = .init(origin: .init(x: leftMiddleMaruX, y: leftMiddleMaruY),
                                          size: self.leftMiddleMaru.frame.size)
        
        var leftBottomMaruX = self.leftBottomMaru.frame.origin.x
        var leftBottomMaruY = self.leftBottomMaru.frame.origin.y
        leftBottomMaruX += 5
        leftBottomMaruY -= 10
        self.leftBottomMaru.frame = .init(origin: .init(x: leftBottomMaruX, y: leftBottomMaruY),
                                          size: self.leftBottomMaru.frame.size)
        
        var rightTopMaruX = self.rightTopMaru.frame.origin.x
        var rightTopMaruY = self.rightTopMaru.frame.origin.y
        rightTopMaruX -= 7
        rightTopMaruY += 5
        self.rightTopMaru.frame = .init(origin: .init(x: rightTopMaruX, y: rightTopMaruY),
                                        size: self.rightTopMaru.frame.size)
        
        var rightMiddleMaruX = self.rightMiddleMaru.frame.origin.x
        var rightMiddleMaruY = self.rightMiddleMaru.frame.origin.y
        rightMiddleMaruX -= 5
        rightMiddleMaruY += 5
        self.rightMiddleMaru.frame = .init(origin: .init(x: rightMiddleMaruX, y: rightMiddleMaruY),
                                           size: self.rightMiddleMaru.frame.size)
        
        var rightBottomMaruX = self.rightBottomMaru.frame.origin.x
        var rightBottomMaruY = self.rightBottomMaru.frame.origin.y
        rightBottomMaruX -= 6
        rightBottomMaruY -= 4
        self.rightBottomMaru.frame = .init(origin: .init(x: rightBottomMaruX, y: rightBottomMaruY),
                                           size: self.rightBottomMaru.frame.size)
        
        self.calculatePositionReached()
    }
    
    private func calculatePositionReached() {
        
        let numberforMatter = NumberFormatter()
        numberforMatter.maximumFractionDigits = 2
        
        if self.gyodon.frame.minX <= self.leftTopMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.leftTopMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.leftTopMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.leftTopMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
        
        if self.gyodon.frame.minX <= self.leftMiddleMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.leftMiddleMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.leftMiddleMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.leftMiddleMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
        
        if self.gyodon.frame.minX <= self.leftBottomMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.leftBottomMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.leftBottomMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.leftBottomMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
        
        if self.gyodon.frame.minX <= self.rightTopMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.rightTopMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.rightTopMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.rightTopMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
        
        if self.gyodon.frame.minX <= self.rightMiddleMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.rightMiddleMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.rightMiddleMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.rightMiddleMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
        
        if self.gyodon.frame.minX <= self.rightBottomMaru.frame.minX &&
            self.gyodon.frame.maxX >= self.rightBottomMaru.frame.maxX &&
            self.gyodon.frame.minY <= self.rightBottomMaru.frame.minY &&
            self.gyodon.frame.maxY >= self.rightBottomMaru.frame.maxY
        {
            self.titleLabel.text = "OMG.. Runtime: \(String(describing: numberforMatter.string(for: runCount)!))s"
            self.endGame()
        }
    }
}
