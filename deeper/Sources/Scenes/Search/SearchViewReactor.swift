//
//  SearchViewReactor.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import ReactorKit
import Resolver
import UIKit

final class SearchViewReactor: BaseReactor, Reactor {
  
  @Injected var daumSearchService: DaumSearchServiceType
  
  enum Action {
    case searchText(String)
    case search
    case willDisplay(IndexPath)
    case selectedItem(IndexPath)
  }
  
  enum Mutation {
    case setQuery(String)
    case setPhotos(Photos.Response)
    case setPagedPhotos(Photos.Response)
    case setSelectedIndex(Int)
  }
  
  struct State {
    fileprivate var query: String = ""
    fileprivate var page: Int = 1
    var photos: Photos.Response?
    var selectedIndex: Int?
  }
  
  var initialState = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .searchText(let query):
      return .just(.setQuery(query))
    case .search:
      guard currentState.query != "" else { return .never() }
      let request = Photos.Request(
        query: currentState.query,
        page: 1
      )
      return daumSearchService.request(
        to: .photos(request),
        type: Photos.Response.self
      ).asObservable()
      .map { Mutation.setPhotos($0) }
    case .willDisplay(let indexPath):
      guard currentState.query != "" else { return .never() }
      guard currentState.photos?.meta.isEnd == false else { return .never() }
      guard let count = currentState.photos?.documents.count else {
        return .never()
      }
      guard indexPath.row == count - 1 else { return .never() }
      let request = Photos.Request(
        query: currentState.query,
        page: currentState.page + 1
      )
      return daumSearchService.request(
        to: .photos(request),
        type: Photos.Response.self
      ).asObservable()
      .map { Mutation.setPagedPhotos($0) }
    case .selectedItem(let indexPath):
      return .just(.setSelectedIndex(indexPath.item))
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    // Reset
    newState.selectedIndex = nil
    
    switch mutation {
    case .setQuery(let query):
      newState.query = query
    case .setPhotos(let photos):
      newState.page = 1
      newState.photos = photos
    case .setPagedPhotos(let photos):
      newState.page += 1
      newState.photos?.meta = photos.meta
      newState.photos?.documents.append(
        contentsOf: photos.documents
      )
    case .setSelectedIndex(let index):
      newState.selectedIndex = index
    }
    return newState
  }
  
}
