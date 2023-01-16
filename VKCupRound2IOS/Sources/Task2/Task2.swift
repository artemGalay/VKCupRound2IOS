//
//  Task2.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class Task2: UIViewController {

    // MARK: - Properties

    private var answers = Categories.answers

    // MARK: - User Interface

    private let titleLabelForTask2: UILabel = {
        let label = UILabel()
        label.text = "Зажми в правом столбике элемент и поставь в нужном порядке."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberOneLabel = NumberLabel(title: "Один")
    private let numberTwoLabel = NumberLabel(title: "Два")
    private let numberThreeLabel = NumberLabel(title: "Три")
    private let numberFourLabel = NumberLabel(title: "Четыре")

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()

    private lazy var answersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AnswersCollectionViewCell.self, forCellWithReuseIdentifier: AnswersCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.dragInteractionEnabled = true
        collectionView.dropDelegate = self
        collectionView.dragDelegate = self
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
        view.addSubview(titleLabelForTask2)
        view.addSubview(answersCollectionView)
        view.addSubview(contentStackView)

        contentStackView.addArrangedSubviews([
            numberOneLabel,
            numberTwoLabel,
            numberThreeLabel,
            numberFourLabel
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            titleLabelForTask2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabelForTask2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabelForTask2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            answersCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            answersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140),
            answersCollectionView.widthAnchor.constraint(equalToConstant: 50),
            answersCollectionView.heightAnchor.constraint(equalToConstant: 240),

            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
            contentStackView.widthAnchor.constraint(equalToConstant: 80),
            contentStackView.heightAnchor.constraint(equalToConstant: 230)

        ])
    }

    private func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath {

            collectionView.performBatchUpdates({
                answers.remove(at: sourceIndexPath.item)
                answers.insert(item.dragItem.localObject as? String ?? "no item",
                                  at: destinationIndexPath.item)

                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            })
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension Task2: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswersCollectionViewCell.identifier,
                                                            for: indexPath) as? AnswersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = answers[indexPath.row]
        cell.titleLabel.preferredMaxLayoutWidth = collectionView.frame.width - 16

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        answers.count
    }
}

// MARK: - UICollectionViewDragDelegate

extension Task2: UICollectionViewDragDelegate {

    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = answers[indexPath.row]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
}

// MARK: - UICollectionViewDropDelegate

extension Task2: UICollectionViewDropDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        dropSessionDidUpdate session: UIDropSession,
                        withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {

        var destinationIndexPath: IndexPath

        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }

        if coordinator.proposal.operation == .move {
            reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
        }
    }
}
