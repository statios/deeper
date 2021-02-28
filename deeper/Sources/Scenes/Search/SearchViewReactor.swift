//
//  SearchViewReactor.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/02/28.
//

import ReactorKit
import Resolver

final class SearchViewReactor: BaseReactor, Reactor {
  
  @Injected var daumSearchService: DaumSearchServiceType
  
  enum Action {
    case searchText(String)
    case search
  }
  
  enum Mutation {
    case setQuery(String)
    case setPhotos([Photo])
  }
  
  struct State {
    fileprivate var query: String?
    fileprivate var page: Int = 1
    var photos: [Photo] = []
  }
  
  var initialState = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .searchText(let query):
      return .just(.setQuery(query))
    case .search:
      let request = Photos.Request(
        query: currentState.query ?? "",
        page: currentState.page
      )
      return daumSearchService.request(
        to: .photos(request),
        type: Photos.Response.self
      ).asObservable()
      .flatMap { Observable.just(Mutation.setPhotos($0.documents)) }
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setQuery(let query):
      newState.query = query
    case .setPhotos(let photos):
      newState.photos = photos
    }
    return newState
  }
  
}
