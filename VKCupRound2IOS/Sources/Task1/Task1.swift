//
//  Task1.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class Task1: UIViewController {

    // MARK: - Properties

    private var questions = Questions.questions
    private var percent = Questions.percent

    // MARK: - User Interface

    private lazy var questionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(QuestionCollectionViewCell.self, forCellWithReuseIdentifier: QuestionCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        view.addSubview(questionsCollectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            questionsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            questionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            questionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            questionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension Task1: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        questions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCollectionViewCell.identifier,
                                                            for: indexPath) as? QuestionCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = questions[indexPath.row]
        cell.percentLabel.text = percent[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension Task1: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 400, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as? QuestionCollectionViewCell
        cell?.backgroundColor = .green
        cell?.percentLabel.isHidden = false
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? QuestionCollectionViewCell
        cell?.backgroundColor = .systemGray5
    }
}
