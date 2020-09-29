//
//  HomeView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 04.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Biding View
    
    @Binding var showProfile: Bool
    @Binding var showContent: Bool
    
    // MARK: - View State
    
    @State var showUpdate = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 16) {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    AvatarBtn(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle()  }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius:  1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateListView()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false ) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                    
                }
                .offset(y: -30)
                
                HStack {
                    Text("Cources")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -60)
                
                Spacer()
            }
            .frame(width: screen.width)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false)).environment(\.colorScheme, .light)
    }
}

struct SectionView: View {
    
    // MARK: - Properties
    
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: section.logo)
                    .font(.system(size: 30, weight: .light, design: .rounded))
                    .foregroundColor(Color.red)
            }
            
            Text(section.subTitle.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .frame(width: 210)
                .aspectRatio(contentMode: .fit)
        }
        .padding()
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: section.color.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}

// MARK: - Model

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype design in SwiftUI", subTitle: "18 Sections", logo: "desktopcomputer", image: Image("2"), color: Color(#colorLiteral(red: 0.03023453988, green: 0.729101181, blue: 0.8875721097, alpha: 1))),
    Section(title: "Build a SwiftUI app", subTitle: "20 Sections", logo: "desktopcomputer", image: Image(uiImage: #imageLiteral(resourceName: "3")), color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))),
    Section(title: "SwiftUI Advanced", subTitle: "20 Sections", logo: "desktopcomputer", image: Image(uiImage: #imageLiteral(resourceName: "ilustration")), color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
]

// MARK: - Views

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            
            HStack(spacing: 12) {
                RingView(firstColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),  secondColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), widht: 44, height: 44, persent: 55, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("8 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 minutes today")
                        .modifier(FontModifier(style: .caption))
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12) {
                RingView(firstColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),  secondColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), widht: 33, height: 33, persent: 88, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12) {
                RingView(firstColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),  secondColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), widht: 32, height: 32, persent: 73, show: .constant(true))
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
