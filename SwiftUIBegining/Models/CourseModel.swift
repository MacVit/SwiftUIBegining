//
//  CourseModel.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 29.09.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Model

struct CourseModel: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var image: URL
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

let courseData: [CourseModel] = [
    
//    Course(title: "SwiftUI", text: "20 Sections", image: URL(string: "https://images.ctfassets.net/45ai08ip1v7d/4kTZllXgL7fRyvACSqpC0U/9df32632f51e49f9f7e2f54b650ce6ff/44.jpeg?h=250")!, logo: #imageLiteral(resourceName: "2"), color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), show: false),
//    Course(title: "Swift", text: "18 Sections", image: URL(string: "https://images.ctfassets.net/45ai08ip1v7d/6SACD8SNvYKF8cmOf96nTU/2b2b4baa40628dbd8f1e7ff337123bd5/55.jpeg?h=250")!, logo: #imageLiteral(resourceName: "5"), color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), show: false),
//    Course(title: "Combile", text: "25 Sections", image: URL(string: "https://images.ctfassets.net/45ai08ip1v7d/4TCx0AWaus2HMtaeOpdRdy/ad798dff398c6e5eb8c8522be7ff4a6f/66.jpeg?h=250")!, logo: #imageLiteral(resourceName: "6"), color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), show: false),
//    Course(title: "Catalist", text: "13 Sections", image: URL(string: "https://images.ctfassets.net/45ai08ip1v7d/uk5zkIU0a7J5mcZZjeEQ0/6e704063e7e8304546b1b7bf8ca4c723/77.jpeg?h=250")!, logo: #imageLiteral(resourceName: "3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false),
//    Course(title: "Dark Mode", text: "8 Sections", image: URL(string: "https://images.ctfassets.net/45ai08ip1v7d/3eugetFJhH3TCreEseu7Qh/c53e90634dcb8cc13bb186a8a165548f/88.jpeg?h=250")!, logo: #imageLiteral(resourceName: "2"), color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), show: false)
]
