//
//  Extension.swift
//  TravelTalkApp
//
//  Created by 심소영 on 6/3/24.
//

import UIKit

protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }
}

extension UITableViewCell: ReusableProtocol {
    static var identifier: String {
        get {
            return String(describing: self)
            //identifier = "UserViewController" -> id값 스트링
            //identifier = "UserViewCell"
        }
    }
}

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
}


extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    static var currentResponder: UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
extension TalkViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        print("touchesBegan")
    }
    
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {

        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue, let talkTextField = UIResponder.currentResponder as? UITextField else { return }
        
        let keyboardYTop = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(talkTextField.frame, from: talkTextField.superview)

        let textFieldYBottom = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

        if textFieldYBottom > keyboardYTop {
            let textFieldYTop = convertedTextFieldFrame.origin.y
            let properTextFieldHight = textFieldYTop - keyboardYTop/1.3
            view.frame.origin.y = CGFloat(-properTextFieldHight)
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

extension UITextField {
 
    func settingTextField(text: String){
        self.largeContentImage = .init(systemName: "star")
        self.placeholder = text
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 16, weight: .heavy)
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray6
    }
}

