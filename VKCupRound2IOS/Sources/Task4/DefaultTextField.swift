//
//  DefaultTextField.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class DefaultTextField: UITextField {

    // MARK: - Initialized

    init() {
        super.init(frame: .zero)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    
    private func configureTextField() {
        placeholder = "слово"
        textAlignment = .center
        clearButtonMode = .whileEditing
        font = .systemFont(ofSize: 26, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
