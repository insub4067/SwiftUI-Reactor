//
//  ContentViewReactor.swift
//  TEST
//
//  Created by 김인섭 on 2023/08/06.
//

import Foundation

class ContentViewReactor: Reactor {
    
    init(state: ContentViewReactor.State) {
        self.state = state
    }
    
    private(set) var state: State
    
    enum Action {
        case didTapButton
    }
    
    class State: ObservableObject {
        @Published var count = 0
    }
    
    func react(_ action: Action) {
        switch action {
        case .didTapButton:
            state.count += 1
        }
    }
}

protocol Reactor: AnyObject {
    
    associatedtype Action
    associatedtype State: AnyObject
    
    var state: State { get }
    
    func react(_ action: Action)
}
