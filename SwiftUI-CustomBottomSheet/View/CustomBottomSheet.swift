//
//  CustomBottomSheet.swift
//  SwiftUI-CustomBottomSheet
//
//  Created by 박현우 on 7/27/24.
//

import SwiftUI

struct CustomBottomSheet<Content: View>: View {
    @State var offsetY: CGFloat = -36
    @State var lastOffsetY: CGFloat = 0
    var content: () -> Content
    
    var body: some View {
        GeometryReader {
            let height = $0.size.height
            
            ZStack {
                Rectangle()
                    .fill(.background)
                    .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
                
                VStack {
                    Capsule()
                        .foregroundStyle(.gray)
                        .frame(width: 64, height: 4)
                        .padding(.top, 18)
                        .padding(.bottom, 18)
                    
                    content()
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .offset(y: height)
            .offset(y: offsetY)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let translationY = value.translation.height + lastOffsetY
                        
                        if -height > translationY || translationY > -36 { return }
                        
                        offsetY = translationY
                    }.onEnded { value in
                        let maxHeight = height
                        
                        withAnimation {
                            if -offsetY > 100 && -offsetY < maxHeight / 2 {
                                offsetY = -300
                            } else if -offsetY > maxHeight / 2 {
                                offsetY = -maxHeight
                            } else {
                                offsetY = -36
                            }
                        }
                        
                        lastOffsetY = offsetY
                    }
            )
        }
    }
}
