//
//  QuestionCollectionViewCell.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class QuestionCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "QuestionCollectionViewCell"

    // MARK: - User Interface

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro-Semibold", size: 26)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro-Semibold", size: 26)
        label.textColor = .black
        label.textAlignment = .right
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initialized

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(percentLabel)
    }

    private func configure() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 5
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            percentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            percentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
