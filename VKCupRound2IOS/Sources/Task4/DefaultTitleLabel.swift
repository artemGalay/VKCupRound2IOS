//
//  DefaultLabel.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class DefaultTitleLabel: UILabel {

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
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 26, weight: .semibold)
        textAlignment = .center
    }
}
