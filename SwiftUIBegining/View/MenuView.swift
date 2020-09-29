//
//  MenuView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 04.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Vitalii - 88% complete")
                    .font(.caption)
                
                Color.white
                    .frame(width: 100, height: 6, alignment: .center)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.3))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24, alignment: .center)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(name: "Account", iconName: "gear")
                MenuRow(name: "Billing", iconName: "creditcard")
                MenuRow(name: "Sign Up", iconName: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8954110146, green: 0.9160918593, blue: 0.9564197659, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("me")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 20)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    // MARK: - ViewState
    
    var name: String
    var iconName: String

    var body: some View {
        HStack(spacing: 16) {
            
            Image(systemName: iconName)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(name)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
