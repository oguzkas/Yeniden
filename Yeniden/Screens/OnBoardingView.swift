//
//  OnBoardingView.swift
//  Yeniden
//
//  Created by Oğuz  on 4.10.2023.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //MARK: HEADER
                Spacer()
                VStack(spacing: 0){
                    Text("Paylaş")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                    Önemli olan ne kadar verdiğimiz değil, vermeye ne kadar sevgi kattığımızdır.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }//: the end of the HEADER
                .opacity(isAnimating ? 1 : 0) //Slide down animation
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                //MARK: CENTER
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isAnimating)
                }//: the end of the CENTER
                Spacer()
                //MARK: FOOTER
                ZStack{
                    //PARTS OF THE CUSTOM BUTTON
                    //1: BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    //2: CALL-TO-ACTION (STATIC)
                    
                    Text("Başlayın")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x:20)
                        
                    
                    //3: CAPSULE DYNAMIC (DYNAMIC WIDTH)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                            Spacer()
                    
                    }
                    
                    //4: CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80,height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged {gesture in
                                if gesture.translation.width > 0  && buttonOffset <= buttonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            }
                            .onEnded{_ in
                                withAnimation(Animation.easeOut(duration: 1)) {
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnBoardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                    buttonOffset = 0
                                }
                            }
                    )//: the end of the gesture
                    Spacer()
                    } //:the end of the HStack
                    
                }//: the end of the FOOTER
                .frame(width:buttonWidth,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }//:VStack
        } //: ZStack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnBoardingView()
}
