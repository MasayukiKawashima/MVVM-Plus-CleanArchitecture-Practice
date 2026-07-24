//
//  RepositoryDTO+Mapping.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

extension RepositoryDTO {
  /// DTO をドメインエンティティ（GitHubRepository）へ変換する
  func toEntity() -> GitHubRepository {
    GitHubRepository(
      fullName: fullName,
      owner: owner.login,   // ネストした OwnerDTO から名前(login)を取り出す
      htmlURL: htmlURL
    )
  }
}
