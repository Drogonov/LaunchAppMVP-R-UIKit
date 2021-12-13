//
//  CapsulesCollectionView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

protocol CapsulesCollectionViewDelegate: AnyObject {
    func capsuleTapped(with capsuleSerial: String?)
}

class CapsulesCollectionView: UIView {
    
    // MARK: - Properties
    
    private var capsules = [CapsuleCellViewModel]()
    weak var delegate: CapsulesCollectionViewDelegate?
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        collectionView.register(
            CapsulesCollectionViewCell.self,
            forCellWithReuseIdentifier: CapsulesCollectionViewCell.reuseId
        )
        
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.layer.masksToBounds = false
        
        return collectionView
    }()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func set(capsules: [CapsuleCellViewModel]) {
        self.capsules = capsules
        collectionView.contentOffset = CGPoint.zero
        collectionView.reloadData()
    }
}

// MARK: - Configure UI

extension CapsulesCollectionView {
    private func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addSubview(collectionView)
        collectionView.anchor(
            top: self.topAnchor,
            leading: self.leftAnchor,
            bottom: self.bottomAnchor,
            trailing: self.rightAnchor,
            paddingTop: 16,
            paddingLeft: 16,
            paddingBottom: 16,
            paddingRight: 16
        )
    }
}

extension CapsulesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return capsules.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CapsulesCollectionViewCell.reuseId,
            for: indexPath
        ) as! CapsulesCollectionViewCell
        
        cell.delegate = self
        cell.set(viewModel: capsules[indexPath.row])
        return cell
    }
}

extension CapsulesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(
            width: (collectionView.bounds.width - 20)/2,
            height: (232 > collectionView.bounds.height/3) ? 232 : (collectionView.bounds.height/3)
        )
    }
}

extension CapsulesCollectionView: CapsulesCollectionViewCellDelegate {
    func capsuleTapped(with capsuleSerial: String?) {
        delegate?.capsuleTapped(with: capsuleSerial)
    }
}
