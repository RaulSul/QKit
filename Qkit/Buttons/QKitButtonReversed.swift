//
//  QKitButtonReversed.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

class QKitButtonReversed: UIButton {
    let backgroundColorHighlighted = UIColor(hex: "#E9E9E9FF")
    let backgroundColorRegular = UIColor.white
    let backgroundColorDisabled = QKitColors.GRAYSCALE_04

    init() {
        super.init(frame: .zero)

        self.backgroundColor = self.backgroundColorRegular
        self.setTitleColor(QKitColors.PRIMARY, for: .normal)
        self.layer.cornerRadius = 8
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
        self.contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ? self.backgroundColorHighlighted : self.backgroundColorRegular
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

