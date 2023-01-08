//
//  DefaultLabel.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 8.01.23.
//

import UIKit

final class DefaultLabel: UILabel {

    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: padding))
        }

        override var intrinsicContentSize : CGSize {
            let superContentSize = super.intrinsicContentSize
            let width = superContentSize.width + padding.left + padding.right
            let heigth = superContentSize.height + padding.top + padding.bottom
            return CGSize(width: width, height: heigth)
        }


    init(title: String) {
        super.init(frame: .zero)
        text = title
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTitleLabel() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheLabel))
        addGestureRecognizer(panGestureRecognizer)
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 26, weight: .semibold)
        textAlignment = .center
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        isUserInteractionEnabled = true
    }

    @objc func dragTheLabel(recognizer: UIPanGestureRecognizer) {

        if recognizer.state == .began {
            layer.borderWidth = 1


        } else if recognizer.state == .changed {
            let translation = recognizer.translation(in: self)

            let newX = center.x + translation.x
            let newY = center.y + translation.y

            center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self)


        } else if recognizer.state == .ended {
            layer.borderWidth = 0

        }

    }
}
