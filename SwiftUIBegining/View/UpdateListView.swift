//
//  UpdateListView.swift
//  SwiftUIBegining
//
//  Created by Vitalii Maksymliuk on 06.02.2020.
//  Copyright © 2020 Vitalii Maksymliuk. All rights reserved.
//

import SwiftUI

struct UpdateListView: View {
    
    // MARK: - Properties

    @ObservedObject var store = StoreData()
    
    // MARK: - Methods

    func addUpdate() {
        store.update.append(Update(image: "5", title: "New Text", text: "New Text", date: "Jan 1"))
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(store.update) { item in
                    NavigationLink(destination: UpdateDetailListView(itemData: item)) {
                        
                        HStack {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(item.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(item.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { self.store.update.remove(at: $0.first!) }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.update.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}

// MARK: - Model

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let listData = [
    Update(image: "5", title: "SwiftUI", text: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.", date: "Jan 1"),
    Update(image: "6", title: "Swift", text: "Swift is a powerful and intuitive programming language for macOS, iOS, watchOS, tvOS and beyond. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast.", date: "Feb 12"),
    Update(image: "4", title: "Combile", text: "The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.", date: "Mar 11"),
    Update(image: "2", title: "Catalist", text: "Bring your iPad app to macOS with Mac Catalyst.", date: "Aug 1"),
    Update(image: "3", title: "Dark Mode", text: "In iOS 13.0 and later, people can choose to adopt a dark system-wide appearance called Dark Mode. In Dark Mode, the system uses a darker color palette for all screens, views, menus, and controls, and it uses more vibrancy to make foreground content stand out against the darker backgrounds. Dark Mode supports all accessibility features.", date: "Sep 9")
]

