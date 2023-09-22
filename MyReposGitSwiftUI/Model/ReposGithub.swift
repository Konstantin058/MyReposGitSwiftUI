//
//  ReposGithub.swift
//  MyReposGitSwiftUI
//
//  Created by Константин Евсюков on 22.09.2023.
//

import Foundation
import SwiftUI

struct ReposGithub: Codable, Identifiable {
    let id: Int
    let name: String
   

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
