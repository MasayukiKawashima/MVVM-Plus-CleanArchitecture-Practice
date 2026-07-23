//
//  HomeViewController.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/21.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

  // HomeView をプロパティとして保持
  private let homeView = HomeView()

  // ViewModel を保持
  private let viewModel = HomeViewModel()

  // Combine の購読を保持
  private var cancellables = Set<AnyCancellable>()

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

    // ViewModel の repositories をバインディング
    bindViewModel()
  }

  // MARK: - Binding

  private func bindViewModel() {
    viewModel.$repositories
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        self?.homeView.tableView.reloadData()
      }
      .store(in: &cancellables)
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
    return viewModel.numberOfRepositories
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = viewModel.repository(at: indexPath.row)
    return cell
  }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  // 行選択時などの処理は後で実装
}
