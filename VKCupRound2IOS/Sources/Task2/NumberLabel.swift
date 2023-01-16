//
//  NumberLabel.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class NumberLabel: UILabel {

    // MARK: - Initialized

    init(title: String) {
        super.init(frame: .zero)
        text = title
        configureTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func configureTitleLabel() {
        textAlignment = .center
        font = UIFont(name: "SFPro-Semibold", size: 26)
        textColor = .black
        textAlignment = .center
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
    }
}
