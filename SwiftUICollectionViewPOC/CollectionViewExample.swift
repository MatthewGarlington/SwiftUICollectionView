//
//  CollectionViewExample.swift
//  SwiftUICollectionViewPOC
//
//  Created by Matthew Garlington on 3/18/22.
//

import SwiftUI
import UIKit

class CollectionViewExample: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Light")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.text = "Find spaces that suit your style"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "xmark")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(logo)
        view.addSubview(label)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 32),
            label.heightAnchor.constraint(equalToConstant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            collectionView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
}

extension CollectionViewExample: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as? MyCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }
        return cell
    }
}

extension CollectionViewExample: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 320)
    }
}


