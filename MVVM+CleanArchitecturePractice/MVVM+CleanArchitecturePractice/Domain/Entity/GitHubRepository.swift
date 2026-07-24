//
//  GitHubRepository.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// アプリが扱うリポジトリを表すドメインエンティティ
/// （データ取得方法には依存しない純粋な表現）
struct GitHubRepository {
  let fullName: String   // 例: "apple/swift"
  let owner: String      // オーナー名（例: "apple"）
  let htmlURL: URL       // リポジトリのWebページURL
}
