//
//  MyReposViewModel.swift
//  MyReposGitSwiftUI
//
//  Created by Константин Евсюков on 22.09.2023.
//

import Foundation
import SwiftUI
import Combine

class MyReposViewModel: ObservableObject {
    
    @Published var myReposViewModel: [ReposGithub] = []
    
    private var bag = Set<AnyCancellable>()
    
    func fetchRepos() {
        
        let urlStr = "https://api.github.com/users/Konstantin058/repos"
        
        guard let url = URL(string: urlStr) else {
            print("Error URL String")
            return }
        
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { res in
                
                guard let response = res.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Bad bad response")
                    throw URLError(.badServerResponse)
                }
                
                let decoder = JSONDecoder()
                
                guard let reposit = try? decoder.decode([ReposGithub].self, from: res.data) else {
                    print("Bad bad URL")
                    throw URLError(.badURL)
                }
                
                return reposit
            }
            .sink { completion in
                switch completion {
                case .finished:
                    print("All Good!!")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnReposit in
                self?.myReposViewModel = returnReposit
            }
            .store(in: &bag)
    }
}
