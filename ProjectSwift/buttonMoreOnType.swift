//
//  buttonMoreOnType.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 02/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit

class buttonMoreOnType: UIButton {

    override var intrinsicContentSize: CGSize {
        let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude)) ?? .zero
        let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
        
        return desiredButtonSize
    }

}
