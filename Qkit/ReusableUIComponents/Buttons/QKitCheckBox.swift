//
//  QKitCheckBox.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitCheckBox: UIView {
    var id: String = "QKitCheckBox"
    
    var isChecked: Bool = false
    var onCheck: ((Bool) -> Void)? // MIGHT WANT TO USE TRAILING FUNCTIONS IN METHODS INSTEAD
    
    lazy var iconCheck: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.isHidden = true
        return imageView
    }()
    
    init(checkMarkImage: UIImage? = nil, borderColor: CGColor? = nil) {
        super.init(frame: .zero)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.toggle))
        
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
        self.isUserInteractionEnabled = true
        self.addSubview(self.iconCheck)
        self.addGestureRecognizer(tapGestureRecognizer)
        
        
        self.iconCheck.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.iconCheck.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.iconCheck.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.iconCheck.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        switch checkMarkImage {
        case nil:
            self.iconCheck.image = UIImage(named: "checkDuo")!
        default:
            self.iconCheck.image = checkMarkImage
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
    
    @objc func toggle() {
        switch self.isChecked {
        case true:
            self.iconCheck.isHidden = true
            self.isChecked = false
            self.onCheck?(false)
        default:
            self.iconCheck.isHidden = false
            self.isChecked = true
            self.onCheck?(true)
        }
    }
    
    @objc func check() {
        self.iconCheck.isHidden = false
        self.isChecked = true
        self.onCheck?(true)
    }
    
    @objc func uncheck() {
        self.iconCheck.isHidden = true
        self.isChecked = false
        self.onCheck?(false)
    }
    
}
