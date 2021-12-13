//
//  CapsulesCollectionViewCell.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

protocol CapsulesCollectionViewCellDelegate: AnyObject {
    func capsuleTapped(with capsuleID: UUID?)
}

class CapsulesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    weak var delegate: CapsulesCollectionViewCellDelegate?
    static let reuseId = "CapsulesCollectionViewCell"
    
    private var capsuleID: UUID? = nil
    private var statusButtonColor: UIColor? = nil
    private var capsuleImage: UIImage? = nil
    private var capsuleName: String? = nil
    private var capsuleEmoji: String? = nil
    
    private let capsuleStatusButtonSize: CGFloat = 16
    private let capsuleImageViewSize: CGFloat = 120
    
    private let capsuleStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true
        return button
    }()
    
    private let capsuleImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.backgroundColor = .systemBackground
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 64)
        return button
    }()
    
    private var capsuleNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    
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
        delegate?.capsuleTapped(with: capsuleID)
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        configureCapsuleStatus()
        configureCapsuleButton()
        configureCapsuleName()

        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
    }
    
    private func configureCapsuleStatus() {
        capsuleStatusButton.backgroundColor = statusButtonColor
        addSubview(capsuleStatusButton)
        capsuleStatusButton.anchor(
            top: self.topAnchor,
            paddingTop: 16,
            width: capsuleStatusButtonSize,
            height: capsuleStatusButtonSize
        )
        capsuleStatusButton.centerX(inView: self)
        capsuleStatusButton.layer.cornerRadius = capsuleStatusButtonSize / 2
        capsuleStatusButton.addShadow()
    }
    
    private func configureCapsuleButton() {
        capsuleImageButton.setImage(capsuleImage, for: .normal)
        capsuleImageButton.setTitle(String(capsuleEmoji ?? "❓"), for: .normal)
        addSubview(capsuleImageButton)
        capsuleImageButton.anchor(
            top: capsuleStatusButton.bottomAnchor,
            paddingTop: 16,
            width: capsuleImageViewSize,
            height: capsuleImageViewSize
        )
        capsuleImageButton.centerX(inView: self)
        capsuleImageButton.layer.cornerRadius = capsuleImageViewSize / 2
        capsuleImageButton.addTarget(self,
                                       action: #selector(capsuleTapped),
                                       for: .touchUpInside)
    }
    
    private func configureCapsuleName() {
        capsuleNameLabel.text = capsuleName
        addSubview(capsuleNameLabel)
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
    
    
    // MARK: - Set
    
    func set(viewModel: CapsuleCellViewModel) {
        capsuleID = viewModel.id
        statusButtonColor = viewModel.statusButtonColor
        capsuleName = viewModel.capsuleName
        capsuleEmoji = viewModel.capsuleEmoji
        configureUI()
    }
}
