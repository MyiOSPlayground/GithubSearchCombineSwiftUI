//
//  GithubRepoSearchApp.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import SwiftUI

@main
struct GithubRepoSearchApp: App {
    var body: some Scene {
        WindowGroup {
            MainSearchView(viewModel: MainSearchViewModel(searchRepository: SearchRepositoryImplement()))
        }
    }
}
