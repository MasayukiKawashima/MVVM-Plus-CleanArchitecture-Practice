//
//  APIError.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/24.
//

import Foundation

/// API通信で発生しうるエラー
enum APIError: Error {
  case invalidURL
  case invalidResponse
}
