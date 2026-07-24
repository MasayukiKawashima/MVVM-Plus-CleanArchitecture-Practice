//
//  GitHubAPIClient.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// GitHub API との通信を抽象化する契約
protocol GitHubAPIClientProtocol {
  func searchRepositories(query: String) async throws -> RepositorySearchResponseDTO
}

/// URLSession を使った GitHubAPIClientProtocol の実装
final class GitHubAPIClient: GitHubAPIClientProtocol {

  private let session: URLSession

  // テスト時に差し替えられるよう URLSession を注入（既定は .shared）
  init(session: URLSession = .shared) {
    self.session = session
  }

  func searchRepositories(query: String) async throws -> RepositorySearchResponseDTO {
    // URL の組み立て（query は URLComponents が自動でエンコード）
    var components = URLComponents(string: "https://api.github.com/search/repositories")
    components?.queryItems = [URLQueryItem(name: "q", value: query)]
    guard let url = components?.url else {
      throw APIError.invalidURL
    }

    // 通信（重い処理は URLSession が別スレッドで実行）
    let (data, response) = try await session.data(from: url)

    // ステータスコードの確認
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
      throw APIError.invalidResponse
    }

    // JSON を DTO へデコード
    return try JSONDecoder().decode(RepositorySearchResponseDTO.self, from: data)
  }
}
