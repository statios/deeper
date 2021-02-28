//
//  DetailViewReactor.swift
//  deeper
//
//  Created by KIHYUN SO on 2021/03/01.
//

import ReactorKit
import Resolver
import UIKit

final class DetailViewReactor: BaseReactor, Reactor {
  
  enum Action {
    case receivePhoto(Photo)
  }
  
  enum Mutation {
    case setPhoto(Photo)
  }
  
  struct State {
    var photo: Photo?
  }
  
  var initialState = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .receivePhoto(let photo):
      return .just(.setPhoto(photo))
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .setPhoto(let photo):
      newState.photo = photo
    }
    return newState
  }
  
}

