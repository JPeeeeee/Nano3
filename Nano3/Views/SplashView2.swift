//
//  SplashView2.swift
//  Nano3
//
//  Created by João Pedro Vieira Santos on 27/09/23.
//

import SwiftUI
import RiveRuntime

struct SplashView2: View {
    
    @State var showIcon = true
    
    var body: some View {
        ZStack {
            RiveViewModel(fileName: "endsplash")
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation (.easeInOut) {
                    showIcon = false
                }
            }
        }
        .preferredColorScheme(.dark)
        .background(.black)
    }
}

#Preview {
    SplashView2()
}
