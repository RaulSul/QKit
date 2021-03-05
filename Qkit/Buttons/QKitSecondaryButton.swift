//
//  QKitSecondaryButton.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QkitSecondaryButton: UIButton {
    var id: String = "QKitSecondaryButtonReversed"
    
    var backgroundColorHighlighted = QKitColors.SECONDARY_03
    var backgroundColorRegular = UIColor.clear
    var backgroundColorDisabled = QKitColors.GRAYSCALE_04
    
    let textColorRegular = QKitColors.SECONDARY_03
    let textColorDisabled = QKitColors.GRAYSCALE_03

    init() {
        super.init(frame: .zero)
        self.backgroundColor = self.backgroundColorRegular
        self.layer.borderWidth = 1
        self.layer.borderColor = QKitColors.SECONDARY_03.cgColor

        self.setTitleColor(self.textColorRegular, for: .normal)
        self.setTitleColor(self.textColorDisabled, for: .disabled)
        self.layer.cornerRadius = 8
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ? backgroundColorHighlighted : backgroundColorRegular
            self.setTitleColor(self.backgroundColorDisabled, for: .highlighted)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? backgroundColorRegular : backgroundColorDisabled
            self.layer.borderColor = self.isEnabled ? QKitColors.SECONDARY_03.cgColor : QKitColors.SECONDARY_03.withAlphaComponent(0.5).cgColor
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
