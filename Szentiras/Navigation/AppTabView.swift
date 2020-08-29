//
//  AppTabView.swift
//  Szentiras
//
//  Created by Gabor Sornyei on 2020. 08. 29..
//

import SwiftUI

struct AppTabView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            BookView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Könyvek")
                }
                .tag(0)
            ReadingView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Olvasás")
                }
                .tag(1)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
