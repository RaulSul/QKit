//
//  QKitButton.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitButton: UIButton {
    let backgroundColorHighlighted = QKitColors.PRIMARY
    let backgroundColorRegular = QKitColors.PRIMARY
    let backgroundColorDisabled = QKitColors.GRAYSCALE_04
    
    let titleColorRegular: UIColor = QKitColors.TEXT_LABEL_COLOR
    let titleColorHighlighted: UIColor = QKitColors.GRAYSCALE_04
    let titleColorDisabled: UIColor = QKitColors.GRAYSCALE_03

    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    func setupUI() {
        self.backgroundColor = self.backgroundColorRegular
        self.setTitleColor(self.titleColorRegular, for: .normal)
        self.setTitleColor(self.titleColorHighlighted, for: .highlighted)
        self.setTitleColor(self.titleColorDisabled, for: .disabled)

        self.layer.cornerRadius = 8
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ? backgroundColorHighlighted : backgroundColorRegular
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? backgroundColorRegular : backgroundColorDisabled
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

