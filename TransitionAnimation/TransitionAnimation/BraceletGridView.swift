//
//  ContentView.swift
//  TransitionAnimation
//
//  Created by ごつ on 2024/11/04.
//

import SwiftUI

struct BraceletGridView: View {
    @Namespace private var namespace
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<10) { index in
                        NavigationLink {
                            BraceletDetailView(braceletIndex: index)
                                .navigationTransition(.zoom(sourceID: "bracelet_\(index)", in: namespace))
                        } label: {
                            BraceletCell(index: index)
                        }
                        .matchedTransitionSource(
                            id: "bracelet_\(index)",
                            in: namespace
                        )
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
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(height: 200)
                .overlay(
                    Text("Bracelet \(braceletIndex + 1)")
                        .foregroundColor(.black)
                )
                .matchedGeometryEffect(id: "bracelet_\(braceletIndex)", in: namespace)
                .padding()
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
