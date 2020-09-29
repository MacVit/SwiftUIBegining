//
//  CourseStore.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 15.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import Contentful
import SwiftUI

final class CourseStore: ObservableObject {
    
    // MARK: - Properties

    @Published var courses: [CourseModel] = courseData
    let servise = RemoteDataService.shared
    
    // MARK: - Inits
    
    init() {
        let colors = [#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
        
        servise.getCourseData(id: "course") { items in
            items.forEach { item in
                self.courses.append(CourseModel(
                                        title: item.fields["title"] as! String,
                                        text: item.fields["text"] as! String,
                                        image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                                        logo: #imageLiteral(resourceName: "4"),
                                        color: colors.randomElement()!,
                                        show: false))
            }
        }
    }
}
