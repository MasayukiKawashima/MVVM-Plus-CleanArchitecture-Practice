//
//  GitHubRepositoryImpl.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// GitHubRepositoryProtocol の実装（データ層）
/// APIクライアントで取得したDTOをEntityへ変換して返す
final class GitHubRepositoryImpl: GitHubRepositoryProtocol {

  private let apiClient: GitHubAPIClientProtocol

  // APIクライアントを注入（既定は本番用の GitHubAPIClient）
  init(apiClient: GitHubAPIClientProtocol = GitHubAPIClient()) {
    self.apiClient = apiClient
  }

  func searchRepositories(query: String) async throws -> [GitHubRepository] {
    // APIからDTOを取得
    let response = try await apiClient.searchRepositories(query: query)
    // DTO配列を Entity配列へ変換して返す
    return response.items.map { $0.toEntity() }
  }
}
