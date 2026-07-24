//
//  StubSearchRepositoriesUseCase.swift
//  MVVM+CleanArchitecturePractice
//
//  ※ データ層実装までの一時的なスタブ。完成後に削除予定。
//

import Foundation

final class StubSearchRepositoriesUseCase: SearchRepositoriesUseCaseProtocol {
  func execute(query: String) async throws -> [GitHubRepository] {
    return [
      GitHubRepository(fullName: "apple/swift", owner: "apple", htmlURL: URL(string: "https://github.com/apple/swift")!),
      GitHubRepository(fullName: "facebook/react", owner: "facebook", htmlURL: URL(string: "https://github.com/facebook/react")!),
      GitHubRepository(fullName: "microsoft/vscode", owner: "microsoft", htmlURL: URL(string: "https://github.com/microsoft/vscode")!)
    ]
  }
}
