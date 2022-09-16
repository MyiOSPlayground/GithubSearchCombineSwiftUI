//
//  MainSearchView.swift
//  GithubRepoSearch
//
//  Created by Aaron Hanwe LEE on 2022/09/16.
//

import SwiftUI
import Combine

struct MainSearchView: View {
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State private var isLoading = false
    var cancelBag = Set<AnyCancellable>()
    weak var test: AnyCancellable?
    
    private let viewModel: MainSearchViewModelType
    
    init(searchText: String = "", viewModel: MainSearchViewModelType) {
        self.viewModel = viewModel
        self.searchText = searchText
        bind()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.outputs.repoTitleResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText) {
                // 아래 자동완성같은거 넣어주면 될듯
//                ForEach(searchResults, id: \.self) { result in
//                    Text("Are you looking for \(result)?").searchCompletion(result)
//                }
            }
            .onChange(of: searchText, perform: { newValue in
                print("test: \(self.test)")
                self.viewModel.inputs.searchRepo(text: searchText)
            })
            .navigationTitle("Contacts")
        }
    }
    
    func searchTextChanged() {
        
    }
    
    private mutating func bind() {
        

    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView(viewModel: MainSearchViewModel(searchRepository: SearchRepositoryImplement()))
    }
}
