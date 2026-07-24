//
//  GitHubRepositoryProtocol.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// GitHub のリポジトリデータ取得を抽象化する契約（ドメイン層）
/// 具体的な取得手段（GitHub API など）はデータ層が実装する
protocol GitHubRepositoryProtocol {
  /// 指定したキーワードでリポジトリを検索する
  func searchRepositories(query: String) async throws -> [GitHubRepository]
}
