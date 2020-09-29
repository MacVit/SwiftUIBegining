//
//  StoreDataModel.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 07.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI
import Combine

final class StoreData: ObservableObject {
    @Published var update: [Update] = listData
}
