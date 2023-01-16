//
//  CollectionViewCell.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class AnswersCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "AnswersCollectionViewCell"

    // MARK: - User Interface

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro-Semibold", size: 26)
        label.textColor = .black
        label.textAlignment = .center
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
    }

    private func configure() {
        layer.cornerRadius = 18
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
}
