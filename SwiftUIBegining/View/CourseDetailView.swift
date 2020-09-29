//
//  CourseDetailView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 13.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    
    // MARK: - View Binding
    @Binding var showView: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    // MARK: - Properties
    
    var course: CourseModel
    
    var body: some View {
        ScrollView {
            
            VStack {
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
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.showView = false
                                self.active = false
                                self.activeIndex = -1
                            }
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
            }
            
            VStack(alignment: .leading, spacing: 30) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API Data, packages and CMS.")
                
                Text("About this Course")
                    .font(.title)
                    .bold()
                
                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
                
                Text("Updates are coming soon...")
            }
            .padding(30)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(showView: .constant(true), active: .constant(true), activeIndex: .constant(-1) , course: courseData[0])
    }
}
