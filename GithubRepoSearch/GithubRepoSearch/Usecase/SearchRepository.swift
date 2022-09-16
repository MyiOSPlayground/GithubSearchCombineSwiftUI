//
//  SearchRepository.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import Combine

protocol SearchRepository {
    func getRepoList() -> Just<Result<[String], Error>>
}
