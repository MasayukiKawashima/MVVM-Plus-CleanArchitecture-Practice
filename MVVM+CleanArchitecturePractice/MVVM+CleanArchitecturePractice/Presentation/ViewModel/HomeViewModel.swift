//
//  HomeViewModel.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/23.
//

import Foundation
import Combine

final class HomeViewModel {

  // 表示するリポジトリ一覧（更新されると購読側へ通知される）
  @Published private(set) var repositories: [GitHubRepository] = []

  private let useCase: SearchRepositoriesUseCaseProtocol

  // UseCase を注入（依存性注入）
  init(useCase: SearchRepositoriesUseCaseProtocol) {
    self.useCase = useCase
  }

  // 表示件数
  var numberOfRepositories: Int {
    repositories.count
  }

  // 指定行のリポジトリを取得
  func repository(at index: Int) -> GitHubRepository {
    repositories[index]
  }

  // キーワードでリポジトリを検索する
  @MainActor
  func search(query: String) async {
    do {
      repositories = try await useCase.execute(query: query)
    } catch {
      // エラーハンドリングは後で実装
      print("検索に失敗しました: \(error)")
    }
  }
}
