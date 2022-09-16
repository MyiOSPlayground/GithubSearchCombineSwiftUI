//
//  SearchRepositoryImplement.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import Combine
import CombineMoya
import Foundation

class SearchRepositoryImplement: SearchRepository {
    
    // MARK: private property
    
    // MARK: property
    
    // MARK: lifeCycle
    
    // MARK: private func
    
    // MARK: func
    
    func getRepoList() -> Just<Result<[String], Error>> {
//        return .init(.failure(NSError(domain: "", code: 0)))
        return .init(.success(["test", "some"]))
    }

}
