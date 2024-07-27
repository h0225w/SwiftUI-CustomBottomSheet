//
//  ContentView.swift
//  SwiftUI-CustomBottomSheet
//
//  Created by 박현우 on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SampleTap("Home", "house.fill")
            SampleTap("Calendar", "calendar")
            SampleTap("Map", "map.fill")
            SampleTap("History", "clock.fill")
            SampleTap("My", "person.fill")
        }
        .tint(.red)
    }
    
    @ViewBuilder
    func SampleTap(_ title: String, _ icon: String) -> some View {
        HomeView()
            .tabItem {
                Image(systemName: icon)
                Text(title)
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.white, for: .tabBar)
    }
}

#Preview {
    ContentView()
}
