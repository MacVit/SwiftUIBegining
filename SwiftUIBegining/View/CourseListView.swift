//
//  CourceList.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 12.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseListView: View {
    
    // MARK: - View States
    
    @State var active = false
    @State var activeIndex = -1
    @State var activeView: CGSize = .zero
    
    // MARK: - Properties Binding

    @ObservedObject var store = CourseStore()
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height / 500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    
                    Text("Cources")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(store.courses.indices, id: \.self) { index in
                        
                        GeometryReader { geometry in
                            CourseView(
                                showView: self.$store.courses[index].show,
                                active: self.$active,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView,
                                course: self.store.courses[index], index: index
                            )
                                .offset(y: self.store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.store.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.store.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct CourceList_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}

struct CourseView: View {
    
    // MARK: - View Binding

    @Binding var showView: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    // MARK: - Properties

    var course: CourseModel
    var index: Int
    
    // MARK: - View
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API Data, packages and CMS.")
                
                Text("About this Course")
                    .font(.title)
                    .bold()
                
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
                
                Text("Updates are coming soon...")
            }
            .padding(30)
            .frame(maxWidth: showView ? .infinity : screen.width - 60, maxHeight: showView ? .infinity : 280, alignment: .top)
            .offset(y: showView ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(showView ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(course.text)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: course.logo)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .opacity(showView ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(showView ? 1 : 0)
                    }
                }
                
                Spacer()
                
                WebImage(url: course.image)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .top)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
                
            .padding(showView ? 30 : 20)
            .padding(.top, showView ? 30 : 0)
            .frame(maxWidth: showView ? .infinity : screen.width - 60, maxHeight: showView ? 460 : 280)
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                showView ?
                    DragGesture()
                    .onChanged { value in
                        guard value.translation.height < 300 else { return }
                        guard value.translation.height > 0 else { return }

                        self.activeView = value.translation
                    }
                    .onEnded { _ in

                        if self.activeView.height > 50 {
                            self.showView = false
                            self.active = false
                            self.activeIndex = -1
                        }
                        self.activeView = .zero
                    }
                    : nil
            )
            .onTapGesture {
                self.showView.toggle()
                self.active.toggle()
                
                if self.showView {
                    self.activeIndex = self.index
                    
                } else {
                    self.activeIndex = -1
                }
            }
        }
        .frame(height: showView ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 100)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            showView ?
                DragGesture()
                    .onChanged { value in
                        guard value.translation.height < 300 else { return }
                        guard value.translation.height > 0 else { return }
                        
                        self.activeView = value.translation
                }
                .onEnded { _ in
                    
                    if self.activeView.height > 50 {
                        self.showView = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}
