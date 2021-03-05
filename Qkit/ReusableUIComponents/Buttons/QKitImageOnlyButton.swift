//
//  QKitImageOnlyButton.swift
//  QKit
//
//  Created by Raul Sulaimanov on 05.03.21.
//

import Foundation
import UIKit

/// A button which only holds an icon. For better touchability
/// the hitbox of this button is bigger then the actual icon size.
class QKitImageOnlyButton: UIButton {
    
    //Generally used to perform background color and icon changes
    var onHighlight: (() -> Void)?
    var onNormal: (() -> Void)?
    var isToggled: Bool = false
    
    var edgeInsets: UIEdgeInsets
    
    lazy var highlightableArea: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = QKitColors.SECONDARY_03
        
        return view
    }()
    
    init(
        image: UIImage,
        edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    ) {
        self.edgeInsets = edgeInsets
        
        super.init(frame: .zero)
        
        self.setImage(image, for: .normal)
        self.contentEdgeInsets = self.edgeInsets
        self.layer.cornerRadius = 8
        self.backgroundColor = .clear
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            switch self.isHighlighted {
            case true:
                self.onHighlight?()
            case false:
                self.onNormal?()
            }
        }
    }
    
    
}
