//
//  TabBarView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 08.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            RootHomeView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            CourseListView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
