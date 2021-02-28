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
  }
  
  enum Mutation {
  }
  
  struct State {
  }
  
  var initialState = State()
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    }
    return newState
  }
  
}

