//
//  QKitRadioButton.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitRadioButton: UIView {
    
    var isChecked: Bool = false
    
    var onCheck: ((Bool) -> Void)? // MIGHT WANT TO USE TRAILING FUNCTIONS IN METHODS INSTEAD
    var onTap :((String?) -> Void)? // MIGHT WANT TO USE TRAILING FUNCTIONS IN METHODS INSTEAD
    
    var id: String = "QKitRadioButton"
    
    private let diameter: CGFloat
    private let distanceBetweenInnerAndOuterCircles: CGFloat
    
    lazy var toggleView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = (self.diameter - (self.distanceBetweenInnerAndOuterCircles * 2)) / 2
        view.isHidden = true
        view.backgroundColor = QKitColors.PRIMARY
        return view
    }()
    
    init(
        checkMarkColor: UIColor? = nil,
        borderColor: CGColor? = nil,
        diameter: CGFloat = 24,
        distanceBetweenInnerAndOuterCircles: CGFloat = 6
    ) {
        self.diameter =  diameter
        self.distanceBetweenInnerAndOuterCircles = distanceBetweenInnerAndOuterCircles
        super.init(frame: .zero)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.cornerRadius = self.diameter / 2
        self.layer.borderColor = UIColor.black.cgColor
        self.isUserInteractionEnabled = true
        self.addSubview(self.toggleView)
        self.addGestureRecognizer(tapGestureRecognizer)
        
        self.toggleView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.distanceBetweenInnerAndOuterCircles).isActive = true
        self.toggleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.distanceBetweenInnerAndOuterCircles).isActive = true
        self.toggleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0 - self.distanceBetweenInnerAndOuterCircles).isActive = true
        self.toggleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0 - self.distanceBetweenInnerAndOuterCircles).isActive = true
        
//        self.toggleView.snp.remakeConstraints { make in
//            make.top.equalTo(self.snp.top).offset(distanceBetweenInnerAndOuterCircles)
//            make.left.equalTo(self.snp.left).offset(distanceBetweenInnerAndOuterCircles)
//            make.right.equalTo(self.snp.right).offset(0 - distanceBetweenInnerAndOuterCircles)
//            make.bottom.equalTo(self.snp.bottom).offset(0 - distanceBetweenInnerAndOuterCircles)
//        }
        
        switch checkMarkColor {
        case nil:
            self.toggleView.backgroundColor = QKitColors.PRIMARY
        default:
            self.toggleView.backgroundColor = checkMarkColor
        }
        
        switch borderColor {
        case nil:
            self.layer.borderColor = QKitColors.GRAYSCALE_03.cgColor
        default:
            self.layer.borderColor = borderColor
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped(){
        self.onTap?(self.id)
    }
    
    @objc func toggle() {
        switch self.isChecked {
        case true:
            self.toggleView.isHidden = true
            self.isChecked = false
        default:
            self.toggleView.isHidden = false
            self.isChecked = true
        }
        
        self.onCheck?(self.isChecked)
        
        print(">>> TOGGLE is \(self.isChecked) <<<")
    }
    
    @objc func check() {
        self.toggleView.isHidden = false
        self.isChecked = true
        self.onCheck?(self.isChecked)
    }
    
    @objc func uncheck() {
        self.toggleView.isHidden = true
        self.isChecked = false
        self.onCheck?(self.isChecked)
    }
    
}

