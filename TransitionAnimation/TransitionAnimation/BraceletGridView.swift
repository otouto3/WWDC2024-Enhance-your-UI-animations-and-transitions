//
//  ContentView.swift
//  TransitionAnimation
//
//  Created by ごつ on 2024/11/04.
//

import SwiftUI

struct BraceletGridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<10) { index in
                        NavigationLink(destination: BraceletDetailView(braceletIndex: index)) {
                            BraceletCell(index: index)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Bracelets")
        }
    }
}

struct BraceletCell: View {
    let index: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.2))
            .frame(height: 120)
            .overlay(
                Text("Bracelet \(index + 1)")
                    .foregroundColor(.black)
            )
    }
}

struct BraceletDetailView: View {
    let braceletIndex: Int
    
    var body: some View {
        VStack {
            Text("Bracelet Detail")
                .font(.largeTitle)
                .padding()
            Text("This is the detail view for Bracelet \(braceletIndex + 1)")
                .padding()
        }
    }
}

struct BraceletGridView_Previews: PreviewProvider {
    static var previews: some View {
        BraceletGridView()
    }
}
