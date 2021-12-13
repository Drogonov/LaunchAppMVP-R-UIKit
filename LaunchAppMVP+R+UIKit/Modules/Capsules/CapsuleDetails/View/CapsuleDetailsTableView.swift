//
//  CapsuleDetailsTableView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//

import UIKit

class CapsuleDetailsTableView: UIView {
    
    // MARK: - Properties
    
    private var capsuleValues: [CapsuleDetailsCellViewModel] = []
    
    private var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .grouped
        )
        
        tableView.register(
            CapsuleDetailsTableViewCell.self,
            forCellReuseIdentifier: CapsuleDetailsTableViewCell.reuseId
        )
        
        tableView.backgroundColor = .systemGroupedBackground
        tableView.layer.masksToBounds = false
        
        return tableView
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
    
    func set(capsuleValues: [CapsuleDetailsCellViewModel]) {
        self.capsuleValues = capsuleValues
        tableView.reloadData()
    }
}

// MARK: - Configure UI

extension CapsuleDetailsTableView {
    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(tableView)
        tableView.anchor(
            top: self.topAnchor,
            leading: self.leftAnchor,
            bottom: self.bottomAnchor,
            trailing: self.rightAnchor
        )
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CapsuleDetailsTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Info"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capsuleValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CapsuleDetailsTableViewCell.reuseId,
            for: indexPath
        ) as! CapsuleDetailsTableViewCell
        let model = capsuleValues[indexPath.row]
        cell.set(title: model.title, value: model.value)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
