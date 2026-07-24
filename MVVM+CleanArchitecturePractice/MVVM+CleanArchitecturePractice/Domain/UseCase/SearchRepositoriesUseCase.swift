//
//  SearchRepositoriesUseCase.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// リポジトリ検索のビジネスロジックを表す契約（ドメイン層）
protocol SearchRepositoriesUseCaseProtocol {
  /// 指定したキーワードでリポジトリを検索する
  func execute(query: String) async throws -> [GitHubRepository]
}

/// SearchRepositoriesUseCaseProtocol の実装
final class SearchRepositoriesUseCase: SearchRepositoriesUseCaseProtocol {

  private let repository: GitHubRepositoryProtocol

  // データ取得の抽象を注入（依存性注入）
  init(repository: GitHubRepositoryProtocol) {
    self.repository = repository
  }

  func execute(query: String) async throws -> [GitHubRepository] {
    return try await repository.searchRepositories(query: query)
  }
}
