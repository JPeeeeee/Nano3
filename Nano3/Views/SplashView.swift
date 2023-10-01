//
//  SplashView.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 27/09/23.
//

import SwiftUI
import RiveRuntime

struct SplashView: View {
    
    @State var showIcon = false
    @State var background = true
    
    var body: some View {
        ZStack {
            if background {
                Rectangle()
                    .fill(.black)
            }
            
            RiveViewModel(fileName: "splashart")
                .view()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .offset(x: -10)
            
            if showIcon {
                Image("vynil")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .cornerRadius(16)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation (.easeInOut) {
                    showIcon = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
                withAnimation (.easeInOut) {
                    showIcon = false
                    background = false
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    SplashView()
}
