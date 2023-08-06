//
//  ContentView.swift
//  TEST
//
//  Created by 김인섭 on 2023/07/17.
//

import SwiftUI

struct ContentView: View {
    
    typealias Reactor = ContentViewReactor
    typealias State = Reactor.State
    
    let reactor: Reactor
    @StateObject var state: State
    
    var body: some View {
        Button {
            reactor.react(.didTapButton)
        } label: {
            Text("\(state.count)")
        }
    }
}

extension ContentView {
    
    static func build() -> ContentView {
        let state = ContentViewReactor.State()
        let reactor = ContentViewReactor(state: state)
        return ContentView(reactor: reactor, state: state)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView.build()
    }
}
