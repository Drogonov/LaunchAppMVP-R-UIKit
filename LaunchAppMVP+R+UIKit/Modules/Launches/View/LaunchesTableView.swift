//
//  LaunchesTableView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

class LaunchesTableView: UIView {
    
    // MARK: - Properties
    
    private var launches: [LaunchesCellViewModel] = []
    private var tableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Construction
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func set(launches: [LaunchesCellViewModel]) {
        self.launches = launches
        tableView.reloadData()
    }
}

// MARK: - Configure UI

extension LaunchesTableView {
    private func configureUI() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.layer.masksToBounds = false
        tableView.backgroundColor = .systemGroupedBackground
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(
            LaunchesTableViewCell.self,
            forCellReuseIdentifier: LaunchesTableViewCell.reuseId
        )
        
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

extension LaunchesTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LaunchesTableViewCell.reuseId,
            for: indexPath
        ) as! LaunchesTableViewCell
        let model = launches[indexPath.row]
        cell.set(model: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
