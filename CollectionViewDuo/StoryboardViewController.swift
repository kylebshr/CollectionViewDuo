//
//  StoryboardViewController.swift
//  CollectionViewDuo
//

import UIKit

class StoryboardViewController: UICollectionViewController {

    let colors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemTeal, .systemBlue, .systemIndigo, .systemPurple, .systemPink, .systemBrown]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Interface Builder can't configure a compositional layout, so it's set here.
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.contentInsetsReference = .safeArea
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath)
        cell.contentView.backgroundColor = colors[indexPath.item]
        let label = cell.viewWithTag(1) as! UILabel
        label.text = String(repeating: "Lorem ipsum dolor sit amet. ", count: indexPath.item % 4 + 1)
        return cell
    }
}
