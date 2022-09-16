//
//  SearchUsecase.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import Combine
import Foundation

class SearchUsecase: NSObject {
    
    // MARK: private property
    
    private let repository: SearchRepository
    
    // MARK: property
    
    // MARK: lifeCycle
    
    init(repository: SearchRepository) {
        self.repository = repository
    }
    
    // MARK: private func
    
    // MARK: func
    
    func getRepoList() -> Just<Result<[String], Error>> {
        return self.repository.getRepoList()
    }
    
}
