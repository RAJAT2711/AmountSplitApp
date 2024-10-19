//
//  AmountSplitAppApp.swift
//  AmountSplitApp
//
//  Created by Rajat Gupta on 19/10/24.
//

import SwiftUI

@main
struct AmountSplitAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
