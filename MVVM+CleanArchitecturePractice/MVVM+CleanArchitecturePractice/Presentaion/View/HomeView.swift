//
//  HomeView.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/21.
//

import UIKit

class HomeView: UIView {

  let searchBar = UISearchBar()
  let tableView = UITableView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    setupSearchBar()
    setupTableView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupSearchBar() {
    searchBar.placeholder = "リポジトリを検索"
    searchBar.searchBarStyle = .minimal
    searchBar.showsCancelButton = true
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(searchBar)

    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }

  private func setupTableView() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
