//
//  ShortsReportBetaApp.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

@main
struct ShortsReportBetaApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
