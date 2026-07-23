//
//  HomeViewModel.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/23.
//

import Foundation
import Combine

final class HomeViewModel {

  // テーブルに表示するリポジトリ一覧（更新されると購読側へ通知される）
  @Published private(set) var repositories: [String] = [
    "apple/swift",
    "tensorflow/tensorflow",
    "facebook/react",
    "microsoft/vscode",
    "torvalds/linux"
  ]

  // 表示件数
  var numberOfRepositories: Int {
    repositories.count
  }

  // 指定行のリポジトリを取得
  func repository(at index: Int) -> String {
    repositories[index]
  }
}
