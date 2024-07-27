//
//  HomeView.swift
//  SwiftUI-CustomBottomSheet
//
//  Created by 박현우 on 7/27/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Rectangle()
            .background(.orange)
            .safeAreaInset(edge: .bottom) {
                CustomBottomSheet {
                    Text("Home")
                }
            }
    }
}

#Preview {
    HomeView()
        .edgesIgnoringSafeArea(.bottom)
}
