//
//  LaunchesView.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct LaunchesView: View {
    
    // MARK: - Properties
    
    let buttonText: String
    let buttonTapped: () -> Void
    
    // MARK: - Construction
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Button {
                buttonTapped()
            } label: {
                Text(buttonText)
            }
            Spacer()
        }
    }
}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesView(
            buttonText: "buttonText",
            buttonTapped: {}
        )
    }
}

