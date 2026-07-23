//
//  HomeViewController.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/21.
//

import UIKit

class HomeViewController: UIViewController {

  // HomeView をプロパティとして保持
  private let homeView = HomeView()

  // テーブルに表示するリポジトリ一覧（後でモデル型に差し替え予定）
  private var repositories: [String] = [
    "apple/swift",
    "tensorflow/tensorflow",
    "facebook/react",
    "microsoft/vscode",
    "torvalds/linux"
  ]

  override func loadView() {
    view = homeView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // searchBar のデリゲート接続
    homeView.searchBar.delegate = self

    // tableView のデリゲート/データソース接続
    homeView.tableView.dataSource = self
    homeView.tableView.delegate = self
  }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""              // 入力中の文字を空にする
    searchBar.resignFirstResponder() // キーボードを閉じる（表示中の場合）
  }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repositories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = repositories[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  // 行選択時などの処理は後で実装
}
