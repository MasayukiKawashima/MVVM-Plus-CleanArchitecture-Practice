//
//  RepositorySearchResponseDTO.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// GitHub 検索APIのレスポンス全体を表すDTO
struct RepositorySearchResponseDTO: Decodable {
  let items: [RepositoryDTO]
}

/// レスポンス内の1リポジトリを表すDTO
struct RepositoryDTO: Decodable {
  let fullName: String
  let owner: OwnerDTO
  let htmlURL: URL

  enum CodingKeys: String, CodingKey {
    case fullName = "full_name"
    case owner
    case htmlURL = "html_url"
  }
}

/// リポジトリのオーナー情報を表すDTO
struct OwnerDTO: Decodable {
  let login: String
}
