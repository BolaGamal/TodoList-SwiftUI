//
//  NoItemsView.swift
//  Todo List SwiftUI
//
//  Created by Bola Gamal on 08/10/2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var isAnimate = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("There are no items!!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Are you a productive person? I think you should click on add button and add a bunch of items to your todo list!")
                .padding(.bottom, 40)
            NavigationLink(destination: AddView()) {
                Text("Add something 🥳")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(isAnimate ? Color.purple : .accentColor) /// change color
                    .clipShape(.buttonBorder)
            }
            .padding(.horizontal, isAnimate ? 30 : 50) /// change width
            .shadow(
                color: isAnimate ? Color.purple.opacity(0.5) : .accentColor.opacity(0.5),
                radius: 10,
                x: 0,
                y: isAnimate ? 30: 20)
            .scaleEffect(isAnimate ? 1.1 : 1.0) /// change size
            .offset(y: isAnimate ? -7 : 0) /// move to up
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .navigationTitle("Todo List 📝")
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !isAnimate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.2)
                    .repeatForever()
            ) {
                isAnimate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationView(content: {
        NoItemsView()
    })
    
}
