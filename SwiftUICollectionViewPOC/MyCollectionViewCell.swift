//
//  MyCollectionViewCell.swift
//  SwiftUICollectionViewPOC
//
//  Created by Matthew Garlington on 3/18/22.
//

import SwiftUI
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier = "MyCollectionViewCell"
    
    lazy var host: UIHostingController = {
        return UIHostingController(rootView: Card())
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        host.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(host.view)
        
        NSLayoutConstraint.activate([
            host.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            host.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func embed(in parent: UIViewController) {
         parent.addChild(host)
         host.didMove(toParent: parent)
         print("MyCollectionViewCell has been added to parent UIViewController")
     }
     
     deinit {
         host.willMove(toParent: nil)
         host.view.removeFromSuperview()
         host.removeFromParent()
         print("MyCollectionViewCell has been cleaned up")
     }
    
}
