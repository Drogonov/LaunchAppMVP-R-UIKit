//
//  LaunchesTableViewCell.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//

import UIKit
import Kingfisher

class LaunchesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseId = "LaunchesTableViewCell"
    
    // MARK: - Variables
    
    private var model = LaunchesCellViewModel()
    
    private let launchPatchImageView = UIImageView()
    private let nameLabel = UILabel()
    private let launchYearLabel = UILabel()
    private let detailsTextView = UILabel()
    
    private lazy var imageBottomConstraint = launchPatchImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)

    private lazy var textBottomConstraint = detailsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    
    // MARK: - Construction
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        set(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        model = LaunchesCellViewModel()
    }
    
    // MARK: - Methods
    
    func set(model: LaunchesCellViewModel) {
        self.model = model
        configureUI()
    }
}

// MARK: - Configure UI

extension LaunchesTableViewCell {
    private func configureUI() {
        configureLauchPatchImageView()
        configureNameLabel()
        configureLaunchYearLabel()
        configureDetailsTextView()
        configureConstraints()
    }
    
    private func configureLauchPatchImageView() {
        if let url = URL(string: model.imageURL) {
            launchPatchImageView.kf.setImage(with: url)
        } else {
            launchPatchImageView.image = UIImage(named: "logo")!
        }
        
        launchPatchImageView.contentMode = .scaleAspectFill
        launchPatchImageView.backgroundColor = .systemBackground
        launchPatchImageView.layer.masksToBounds = true
        
        contentView.addSubview(launchPatchImageView)
        launchPatchImageView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leftAnchor,
            paddingTop: 16,
            paddingLeft: 16,
            width: Constant.launchPatchImageViewSize,
            height: Constant.launchPatchImageViewSize
        )
    }
    
    private func configureNameLabel() {
        nameLabel.text = model.name
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        contentView.addSubview(nameLabel)
        nameLabel.anchor(
            top: contentView.topAnchor,
            leading: launchPatchImageView.rightAnchor,
            trailing: contentView.rightAnchor,
            paddingTop: 8,
            paddingLeft: 16,
            height: 30
        )
    }
    
    private func configureLaunchYearLabel() {
        launchYearLabel.text = model.launchYear
        launchYearLabel.numberOfLines = 0
        launchYearLabel.adjustsFontForContentSizeCategory = true
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        
        contentView.addSubview(launchYearLabel)
        launchYearLabel.anchor(
            top: nameLabel.bottomAnchor,
            leading: launchPatchImageView.rightAnchor,
            trailing: contentView.rightAnchor,
            paddingTop: 8,
            paddingLeft: 16,
            height: 30
        )
    }
    
    private func configureDetailsTextView() {
        detailsTextView.text = model.details
        detailsTextView.numberOfLines = 0
        detailsTextView.adjustsFontForContentSizeCategory = true
        
        contentView.addSubview(detailsTextView)
        detailsTextView.anchor(
            top: launchYearLabel.bottomAnchor,
            leading: launchPatchImageView.rightAnchor,
            //            bottom: contentView.bottomAnchor,
            trailing: contentView.rightAnchor,
            paddingTop: 8,
            paddingLeft: 16
        )
    }
    
    private func configureConstraints() {
        let font = UIFont.systemFont(ofSize: 14)
        let width = UIScreen.screenWidth - (Constant.launchPatchImageViewSize + 16 + 8)
        let height = model.details.height(withConstrainedWidth: width, font: font)
        
        if height < 20 {
            imageBottomConstraint.isActive = true
            textBottomConstraint.isActive = false
            imageBottomConstraint.priority = .defaultLow
        } else {
            imageBottomConstraint.isActive = false
            textBottomConstraint.isActive = true
        }
    }
}

// MARK: - Constants

extension LaunchesTableViewCell {
    private enum Constant {
        static let launchPatchImageViewSize: CGFloat = 120
    }
}
