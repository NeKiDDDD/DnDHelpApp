//
//  Open5eAPI.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 13.10.2024.
//

import SwiftUI
import Moya

enum Open5eAPI: TargetType {
  case getClasses
  case getMonsters(page: Int, pageSize: Int)
  case getSpells
  case getItemDetails(endpoint: String)
  case getOneClass(endpoint: String)
  
//  var baseURL: URL {
//    URL(string: "https://api.open5e.com")!
//  }
  
  var baseURL: URL {
    URL(string: "http://localhost:3000")!
  }
  
  var path: String {
    switch self {
    case .getClasses:
      return "/api/classes/"
    case .getMonsters:
      return "/api/monsters/"
    case .getSpells:
      return "/api/spells/"
    case .getItemDetails(let endpoint):
      return "/api/\(endpoint)/"
    case .getOneClass(let endpoint):
      return "\(endpoint)"
    }
  }
  
  var method: Moya.Method {
    .get
  }
  
  var task: Task {
    switch self {
    case .getMonsters(let page, let pageSize):
      return .requestParameters(parameters: ["page": page, "limit": pageSize], encoding: URLEncoding.queryString)
    case .getClasses, .getSpells, .getItemDetails, .getOneClass:
      return .requestPlain
    }
  }
  
  
  var headers: [String: String]? {
    ["Content-Type": "application/json"]
  }
}

@Observable final class Open5eService {
  private let provider = MoyaProvider<Open5eAPI>()
  
  var classes: [SimpleClass] = []
  var monsters: [Monster] = []
  var spells: [String] = []
  var oneClass: Class?
  
  private var currentPage = 1
  private let pageSize = 50
  var hasMoreMonsters = true
  
  func fetchMonsters() {
    fetchMonsters(page: currentPage)
  }
  
  func fetchMoreMonsters(completion: @escaping (Bool) -> Void) {
    guard hasMoreMonsters else {
      completion(false)
      return
    }
    currentPage += 1
    fetchMonsters(page: currentPage, completion: completion)
  }
  
  func fetchClasses() {
    provider.request(.getClasses) { result in
      switch result {
      case .success(let response):
        do {
//          print(String(data: response.data, encoding: .utf8) ?? "Нет данных")
          let decodedClasses = try JSONDecoder().decode(ClassesResponse.self, from: response.data)
          DispatchQueue.main.async {
            self.classes = decodedClasses.results
          }
        } catch {
          print("Ошибка декодирования: \(error)")
        }
      case .failure(let error):
        print("Ошибка запроса: \(error.localizedDescription)")
      }
    }
  }
  
  func fetchOneClass(with url: String) {
    provider.request(.getOneClass(endpoint: url)) { result in
      switch result {
      case .success(let response):
        do {
          print(String(data: response.data, encoding: .utf8) ?? "Нет данных")
          let decodedClasses = try JSONDecoder().decode(Class.self, from: response.data)
          DispatchQueue.main.async {
            self.oneClass = decodedClasses.self
          }
        } catch {
          print("Ошибка декодирования: \(error)")
        }
      case .failure(let error):
        print("Ошибка запроса: \(error.localizedDescription)")
      }
    }
  }
  
  private func fetchMonsters(page: Int, completion: ((Bool) -> Void)? = nil) {
    provider.request(.getMonsters(page: page, pageSize: pageSize)) { result in
      switch result {
      case .success(let response):
        do {
          let _ = try JSONDecoder().decode(Monster.self, from: response.data)
          DispatchQueue.main.async {
//            self.monsters += decoded.results
//            self.hasMoreMonsters = !decoded.results.isEmpty
            completion?(true)
          }
        } catch {
          print("Decoding error: \(error)")
          completion?(false)
        }
      case .failure(let error):
        print("Request failed: \(error.localizedDescription)")
        completion?(false)
      }
    }
  }
}



