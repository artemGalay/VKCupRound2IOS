//
//  ViewController.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 6.01.23.
//

import UIKit

final class Task3: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст               несколькими пропусками          вариантами."
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let oneLabel = DefaultLabel(title: "один")
    private let twoLabel = DefaultLabel(title: "два")
    private let withLabel = DefaultLabel(title: "с")
    private let andLabel = DefaultLabel(title: "и")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(oneLabel)
        view.addSubview(twoLabel)
        view.addSubview(withLabel)
        view.addSubview(andLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            oneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            oneLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),

            twoLabel.centerYAnchor.constraint(equalTo: oneLabel.centerYAnchor),
            twoLabel.leadingAnchor.constraint(equalTo: oneLabel.trailingAnchor, constant: 10),

            withLabel.centerYAnchor.constraint(equalTo: twoLabel.centerYAnchor),
            withLabel.leadingAnchor.constraint(equalTo: twoLabel.trailingAnchor, constant: 10),

            andLabel.centerYAnchor.constraint(equalTo: withLabel.centerYAnchor),
            andLabel.leadingAnchor.constraint(equalTo: withLabel.trailingAnchor, constant: 10)
        ])
    }
}
