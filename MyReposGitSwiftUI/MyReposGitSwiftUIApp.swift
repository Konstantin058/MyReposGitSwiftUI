//
//  MyReposGitSwiftUIApp.swift
//  MyReposGitSwiftUI
//
//  Created by Константин Евсюков on 22.09.2023.
//

import SwiftUI

@main
struct MyReposGitSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
