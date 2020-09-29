//
//  UpdateDetailListView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 06.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct UpdateDetailListView: View {
    
    // MARK: - Properties
    
    var itemData = listData[0]

    var body: some View {
        List {
            VStack {
                Image(itemData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(itemData.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(itemData.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetailListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailListView()
    }
}
