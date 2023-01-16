//
//  Task4.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class Task4: UIViewController {

    private let firstTitleLabel = DefaultTitleLabel(title: "Текст")
    private let secondTitleLabel = DefaultTitleLabel(title: "несколькими")
    private let thirdTitleLabel = DefaultTitleLabel(title: "пропусками")
    private let fourthTitleLabel = DefaultTitleLabel(title: "вариантами.")

    private let firstTextField = DefaultTextField()
    private let secondTextField = DefaultTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(firstTitleLabel)
        view.addSubview(secondTitleLabel)
        view.addSubview(thirdTitleLabel)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(fourthTitleLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            firstTextField.centerYAnchor.constraint(equalTo: firstTitleLabel.centerYAnchor),
            firstTextField.leadingAnchor.constraint(equalTo: firstTitleLabel.trailingAnchor, constant: 5),
            firstTextField.widthAnchor.constraint(equalToConstant: 100),

            secondTitleLabel.centerYAnchor.constraint(equalTo: firstTextField.centerYAnchor),
            secondTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),

            thirdTitleLabel.topAnchor.constraint(equalTo: firstTitleLabel.bottomAnchor, constant: 5),
            thirdTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            secondTextField.centerYAnchor.constraint(equalTo: thirdTitleLabel.centerYAnchor),
            secondTextField.leadingAnchor.constraint(equalTo: thirdTitleLabel.trailingAnchor, constant: 5),
            secondTextField.widthAnchor.constraint(equalToConstant: 100),

            fourthTitleLabel.centerYAnchor.constraint(equalTo: secondTextField.centerYAnchor),
            fourthTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
