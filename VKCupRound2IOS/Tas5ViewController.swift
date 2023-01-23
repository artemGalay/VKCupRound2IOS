//
//  Tas5ViewController.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class Task5: UIViewController {

        // MARK: - Properties

        private var selectedRate: Int = 0

        private let feedbackGenerator = UISelectionFeedbackGenerator()

        // MARK: - User Interface

        private let container: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 70
            stackView.axis = .vertical
            return stackView
        }()

        private lazy var starsContainer: UIStackView = {
            let stackView = UIStackView()

            stackView.axis = .horizontal
            stackView.distribution = .fillEqually

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
            stackView.addGestureRecognizer(tapGesture)

            return stackView
        }()

        // MARK: - Lifecycle

        override func viewDidLoad() {
            super.viewDidLoad()
            createStars()
            setupHierarchy()
        }

        // MARK: - User Action

        @objc private func didSelectRate(gesture: UITapGestureRecognizer) {
            let location = gesture.location(in: starsContainer)
            let starWidth = starsContainer.bounds.width / CGFloat(Constants.starsCount)
            let rate = Int(location.x / starWidth) + 1

            if rate != self.selectedRate {
                feedbackGenerator.selectionChanged()
                self.selectedRate = rate
            }

            starsContainer.arrangedSubviews.forEach { subview in
                guard let starImageView = subview as? UIImageView else {
                    return
                }
                starImageView.isHighlighted = starImageView.tag <= rate
            }
        }

        // MARK: - Private methods

        private func createStars() {
            for index in 1...Constants.starsCount {
                let star = makeStarIcon()
                star.tag = index
                starsContainer.addArrangedSubview(star)
            }
        }

        private func makeStarIcon() -> UIImageView {

            let imageView = UIImageView(image: UIImage(named: "icon_star"),
                                        highlightedImage: UIImage(named: "icon_star_fill"))
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            return imageView
        }

        private func setupHierarchy() {
            view.backgroundColor = .white
            view.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.containerHorizontalInsets).isActive = true
            container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.containerHorizontalInsets).isActive = true
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            starsContainer.translatesAutoresizingMaskIntoConstraints = false
            starsContainer.heightAnchor.constraint(equalToConstant: Constants.starContainerHeight).isActive = true

            container.addArrangedSubview(starsContainer)
        }

        // MARK: - Constants {

        private struct Constants {
            static let starsCount: Int = 5
            static let containerHorizontalInsets: CGFloat = 30
            static let starContainerHeight: CGFloat = 40
        }
    }
