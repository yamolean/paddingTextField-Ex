//
//  ViewController.swift
//  paddingTextField
//
//  Created by 矢守叡 on 2019/11/28.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ここ
        textField.addPadding(20)
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 30
        textField.layer.masksToBounds = true
    }
}

extension UITextField {
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    func setPlaceHolder(textColor: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: textColor])
    }
    func addPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = .always
    }
    enum Place {
        case left
        case right
    }
    func addIcon(_ image: UIImage, place: Place, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        switch place {
        case .left:
            leftView = imageView
            leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
            leftViewMode = .always
        case .right:
            rightView = imageView
            rightView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
            rightViewMode = .always
        }
    }
}
