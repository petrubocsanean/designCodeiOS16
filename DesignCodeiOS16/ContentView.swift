//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Petru Bocsanean on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("card")
            case .charts:
                DetailView()
            case .radial:
                Text("radial")
            case .halfsheet:
                MenuView()
            case .gooey:
                Text("Goey")
            case .actionbutton:
                Text("Action Button")
            }
        }
        .onTapGesture {
            
        }
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
