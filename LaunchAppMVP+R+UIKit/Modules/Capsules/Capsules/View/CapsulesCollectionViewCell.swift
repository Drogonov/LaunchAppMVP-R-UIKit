//
//  CapsulesCollectionViewCell.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

protocol CapsulesCollectionViewCellDelegate: AnyObject {
    func capsuleTapped(with capsuleSerial: String?)
}

class CapsulesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    weak var delegate: CapsulesCollectionViewCellDelegate?
    static let reuseId = "CapsulesCollectionViewCell"
    
    // MARK: - Variables
    
    private var capsuleID: UUID? = nil
    private var statusButtonColor: UIColor? = nil
    private var capsuleImage: UIImage? = nil
    private var capsuleName: String? = nil
    private var capsuleEmoji: String? = nil
        
    private let capsuleStatusButton = UIButton(type: .system)
    private let capsuleImageButton = UIButton(type: .system)
    private let capsuleNameLabel = UILabel()
    
    // MARK: - Construction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        capsuleID = nil
        statusButtonColor = nil
        capsuleImage = nil
        capsuleName = nil
        capsuleEmoji = nil
    }
    
    // MARK: - Selectors
    
    @objc func capsuleTapped() {
        delegate?.capsuleTapped(with: capsuleName)
    }
    
    // MARK: - Methods
    
    func set(viewModel: CapsuleCellViewModel) {
        capsuleID = viewModel.id
        statusButtonColor = viewModel.statusButtonColor
        capsuleName = viewModel.capsuleName
        capsuleEmoji = viewModel.capsuleEmoji
        configureUI()
    }
}

// MARK: - Configure UI

extension CapsulesCollectionViewCell {
    private func configureUI() {
        configureCapsuleStatus()
        configureCapsuleButton()
        configureCapsuleName()
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
    }
    
    private func configureCapsuleStatus() {
        capsuleStatusButton.backgroundColor = statusButtonColor
        capsuleStatusButton.layer.masksToBounds = true

        contentView.addSubview(capsuleStatusButton)
        capsuleStatusButton.anchor(
            top: self.topAnchor,
            paddingTop: 16,
            width: Constant.capsuleStatusButtonSize,
            height: Constant.capsuleStatusButtonSize
        )
        capsuleStatusButton.centerX(inView: self)
        capsuleStatusButton.layer.cornerRadius = Constant.capsuleStatusButtonSize / 2
        capsuleStatusButton.addShadow()
    }
    
    private func configureCapsuleButton() {
        capsuleImageButton.setImage(capsuleImage, for: .normal)
        capsuleImageButton.setTitle(
            String(capsuleEmoji ?? "❓"),
            for: .normal
        )
        capsuleImageButton.contentMode = .scaleAspectFill
        capsuleImageButton.backgroundColor = .systemBackground
        capsuleImageButton.layer.masksToBounds = true
        capsuleImageButton.layer.borderColor = UIColor.label.cgColor
        capsuleImageButton.layer.borderWidth = 2
        capsuleImageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 64)
        
        contentView.addSubview(capsuleImageButton)
        capsuleImageButton.anchor(
            top: capsuleStatusButton.bottomAnchor,
            paddingTop: 16,
            width: Constant.capsuleImageViewSize,
            height: Constant.capsuleImageViewSize
        )
        capsuleImageButton.centerX(inView: self)
        capsuleImageButton.layer.cornerRadius = Constant.capsuleImageViewSize / 2
        capsuleImageButton.addTarget(
            self,
            action: #selector(capsuleTapped),
            for: .touchUpInside
        )
    }
    
    private func configureCapsuleName() {
        capsuleNameLabel.text = capsuleName
        capsuleNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        capsuleNameLabel.textAlignment = .center
        
        contentView.addSubview(capsuleNameLabel)
        capsuleNameLabel.anchor(
            top: capsuleImageButton.bottomAnchor,
            leading: self.leftAnchor,
            trailing: self.rightAnchor,
            paddingTop: 16,
            paddingLeft: 16,
            paddingBottom: 16,
            paddingRight: 16
        )
    }
}

// MARK: - Constants

extension CapsulesCollectionViewCell {
    private enum Constant {
        static let capsuleStatusButtonSize: CGFloat = 16
        static let capsuleImageViewSize: CGFloat = 120
    }
}

