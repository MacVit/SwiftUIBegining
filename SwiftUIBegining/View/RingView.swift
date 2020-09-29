//
//  RingView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 10.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    // MARK: - Properties

    var firstColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var secondColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var widht: CGFloat = 300
    var height: CGFloat = 300
    var persent: CGFloat  = 90
    
    // MARK: - Properties States
    
    @Binding var show: Bool
    
    
    var body: some View {
        
        let multiplier =  widht / 44
        let progress = 1 - persent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: widht, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(firstColor), Color(secondColor)]), startPoint: .topTrailing , endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier , lineCap: .round, lineJoin: .round, miterLimit: .infinity , dash: [20, 0], dashPhase: 20)
            )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0 ))
                .frame(width: widht, height: height)
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(persent)) %")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
