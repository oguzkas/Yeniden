//
//  HomeView.swift
//  Yeniden
//
//  Created by Oğuz  on 4.10.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        VStack {
            //MARK: HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35 )
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                            ,value: isAnimating
                    )
            }
            
            //MARK: CENTER
            Text("Ustalığa giden süreç odaklanmamızın yoğunluğuna bağlıdır.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            //MARK: FOOTER
            Spacer()
            
            Button(action: {
                withAnimation {
                    isOnBoardingViewActive = true
                }
                
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Yeniden")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 40)
            .animation(.easeOut(duration: 1), value: isAnimating)
        }//: VStack
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
