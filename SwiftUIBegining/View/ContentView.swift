//
//  ContentView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 01.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var show = false
    @State private var viewState: CGSize = .zero
    @State private var showCard = false
    @State private var buttomCardState: CGSize = .zero
    @State private var showFullCard = false

    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -150 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            
            BackgroundCard()
                .frame(width: showCard ? 280 : 300, height: 120, alignment: .center)
                .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                .opacity(0.8)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -150 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroundCard()
                .frame(width: 300, height: 120, alignment: .center)
                .background(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                .opacity(0.8)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -110 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 325 : 300, height: 120, alignment: .center)
                .background(Color(#colorLiteral(red: 1, green: 0.7427830696, blue: 0.1289406717, alpha: 1)))
                .clipShape(
                    RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous)
                )
                .shadow(radius: 20)
                .padding(0)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -50 : 0)
                .blendMode(.sourceAtop)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.show = false
                }
            )
            
            ButtomCardView(show: $showCard)
                .offset(x: 0, y: showCard ? 400 : 1000)
                .offset(y: buttomCardState.height)
                .blur(radius: show ? 20 : 0)
                .animation(
                    .timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8)
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.buttomCardState = value.translation
                        
                        if self.showFullCard {
                            self.buttomCardState.height += -300
                        }
                        
                        if self.buttomCardState.height < -300 {
                            self.buttomCardState.height = -300
                        }
                }
                    
                .onEnded { _ in
                    if self.buttomCardState.height > 50 {
                        self.showCard = false
                    
                    } else if (self.buttomCardState.height < -100 && !self.showFullCard) || (self.buttomCardState.height < -250 && self.showFullCard) {
                        self.buttomCardState.height = -300
                        self.showFullCard = true
                    
                    } else {
                        self.buttomCardState = .zero
                        self.showFullCard = false
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct  CardView: View {
    var body: some View {
        HStack {
            HStack {
                VStack(spacing: 5) {
                    
                    Text("Hello, World!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("It's SwiftUI 🙋🏻‍♂️")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.purple)
                }
                .padding(.vertical, 20)
            }
            
            Image(systemName: "star.circle.fill")
                .font(Font.system(size: 40, weight: .light))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundCard: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
                
            .padding()
            Image("ilustration")
                .resizable()
                .scaledToFit()
            Spacer()
        }
    }
}

struct ButtomCardView: View {
    
    // MARK: - UI State
    
    @Binding var show: Bool

    var body: some View {
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(width: 40, height: 5, alignment: .center)
                .cornerRadius(3)
                .opacity(0.2)
            
            Text("A toggle in SwiftUI is a control which can go between on and off states and it’s equivalent to UISwitch in UIKit. In this tutorial we’re going to learn how to create a toggle and use it in various examples. We’re going to update a view (show/hide an image) based on a toggle state, create custom ")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            HStack(spacing: 20) {
                RingView(firstColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), secondColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), widht: 88, height: 88, persent: 88, show: $show)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Swfit UI")
                        .fontWeight(.bold)
                    
                    Text("20 of 20 sections completed\n11 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20) 
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                 
            }
            
            Spacer()
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(BlurView(style: .systemUltraThinMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
