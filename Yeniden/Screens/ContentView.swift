//
//  ContentView.swift
//  Yeniden
//
//  Created by Oğuz  on 4.10.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnBoardingActive: Bool = true
    
    
    var body: some View {
        ZStack{
            if isOnBoardingActive {
                OnBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
