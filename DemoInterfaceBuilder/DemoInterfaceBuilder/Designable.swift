//
//  Designable.swift
//  DemoInterfaceBuilder
//
//  Created by iexm01 on 10/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

//MARK: - Custom button
@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.green {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
//
//    @IBInspectable var borderWidth: CGFloat = 1.0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//
//    @IBInspectable var cornurRadius: CGFloat = 1.0 {
//        didSet {
//            layer.cornerRadius = cornurRadius
//            clipsToBounds = true
//        }
//    }

    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        configure()
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    
    func configure() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = 3.0
        layer.cornerRadius = 5.0
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.purple
    }
    
}

//MARK: - Custom Label
@IBDesignable
class CustomLabel: UILabel {
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        configure()
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    func configure() {
        layer.borderColor = UIColor.brown.cgColor
        layer.borderWidth = 3.0
        layer.cornerRadius = 5.0
        textColor = UIColor.orange
        backgroundColor = UIColor.yellow
        textAlignment = .center
        frame.size.height = 40
        frame.size.width = 175
    }
}

//MARK: - Custom View
@IBDesignable
class CustomView: UIView {
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        configure()
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    func configure() {
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 3.0
        layer.cornerRadius = 5.0
        backgroundColor = UIColor.cyan
    }
}
