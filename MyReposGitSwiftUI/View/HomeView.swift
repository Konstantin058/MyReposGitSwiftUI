//
//  HomeView.swift
//  MyReposGitSwiftUI
//
//  Created by Константин Евсюков on 22.09.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var repositViewModel = MyReposViewModel()
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                VStack {
                    
                    List(repositViewModel.myReposViewModel) { repos in
                        Text("Мои работы - \(repos.name)")
                            .font(.title2)
                            .bold()
                    }
                }
                .navigationTitle("My Repositories")
                .onAppear {
                    self.repositViewModel.fetchRepos()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
