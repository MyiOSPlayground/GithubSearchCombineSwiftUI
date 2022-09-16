//
//  MainSearchViewModel.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import Foundation
import Combine

protocol MainSearchViewModelType {
    var inputs: MainSearchViewModelInputs { get }
    var outputs: MainSearchViewModelOutputs { get }
}

protocol MainSearchViewModelInputs {
    func searchRepo(text: String)
}

protocol MainSearchViewModelOutputs {
    var repoTitleResults: [String] { get }
    var isLoading: Bool { get }
    var err: PassthroughSubject<String, Error> { get }
}

class MainSearchViewModel: MainSearchViewModelType, MainSearchViewModelInputs, MainSearchViewModelOutputs, ObservableObject {
    
    // MARK: private property
    
    private let usecase: SearchUsecase
    
    // MARK: property
    
    var inputs: MainSearchViewModelInputs {
        return self
    }
    
    var outputs: MainSearchViewModelOutputs {
        return self
    }
    
    @Published var repoTitleResults: [String] = []
    @Published var isLoading: Bool = false
    var err: PassthroughSubject<String, Error> = .init()
    
    
    // MARK: lifeCycle
    
    init(searchRepository: SearchRepository) {
        self.usecase = SearchUsecase(repository: SearchRepositoryImplement())
    }
    
    // MARK: private func
    
    // MARK: func
    
    func searchRepo(text: String) {
        self.isLoading = true
        self.usecase.getRepoList()
            .sink { [weak self] completion in
                print("completion: \(completion)")
            } receiveValue: { result in
                switch result {
                case .success(let results):
                    self.repoTitleResults = results
                    self.isLoading = false
                case .failure(let err):
                    self.outputs.err.send(err.localizedDescription)
                }
            }
    }
    
}
