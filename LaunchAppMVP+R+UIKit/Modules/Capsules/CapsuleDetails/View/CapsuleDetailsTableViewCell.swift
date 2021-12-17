//
//  CapsuleDetailsTableViewCell.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

class CapsuleDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let reuseId = "CapsuleDetailsTableViewCell"

    // MARK: - Variables

    private var title: String = ""
    private var value: String = ""
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    // MARK: - Construction

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        set(title: title, value: value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title = ""
        value = ""
    }
    
    // MARK: - Methods
    
    func set(title: String, value: String) {
        self.title = title + ":"
        self.value = value
        configureUI()
    }
}

// MARK: - Configure UI

extension CapsuleDetailsTableViewCell {
    private func configureUI() {
        configureTitleLabel()
        configureValueLabel()
    }
    
    private func configureTitleLabel() {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(
            top: contentView.topAnchor,
            leading: contentView.leftAnchor,
            paddingTop: 8,
            paddingLeft: 16,
            width: 80
        )
    }
    
    private func configureValueLabel() {
        valueLabel.text = value
        valueLabel.numberOfLines = 0
        valueLabel.adjustsFontForContentSizeCategory = true
        valueLabel.font = UIFont.systemFont(ofSize: 16)

        contentView.addSubview(valueLabel)
        valueLabel.anchor(
            top: contentView.topAnchor,
            leading: titleLabel.rightAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.rightAnchor,
            paddingTop: 8,
            paddingLeft: 8,
            paddingBottom: 8,
            paddingRight: 8
        )
    }
}
