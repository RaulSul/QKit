//
//  QKitSecondaryButtonReversed.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitSecondaryButtonReversed: UIButton {
    var backgroundColorHighlighted = UIColor.white
    var backgroundColorRegular = UIColor.clear
    var backgroundColorDisabled = QKitColors.GRAYSCALE_04
    var id: String = "QKitSecondaryButtonReversed"

    init() {
        super.init(frame: .zero)
        self.backgroundColor = self.backgroundColorRegular
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor

        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(QKitColors.SECONDARY_03, for: .highlighted)
        self.setTitleColor(QKitColors.GRAYSCALE_03, for: .disabled)
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
            self.layer.borderColor = UIColor.white.cgColor
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
