//
//  WeightGrid.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/24.
//

import SwiftUI
import Domain

struct WeightGrid: View {
    let weights: [Weight]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("プレート")
                .font(.system(size: 18, weight: .bold))
                .padding(.top, 10)
                .padding(.horizontal, 20)
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: 16
            ) {
                ForEach(weights, id: \.self) { weight in
                    VStack {
                        Text("\(weight.value , specifier: "%.2f")kg")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .overlay {
                                Circle()
                                    .stroke(Color(uiColor: .fromARGB(weight.color)), lineWidth: 3)
                            }
                        
                        HStack {
                            Button(action: {
                            }) {
                                Image(systemName: "minus.circle")
                                    .font(.system(size: 28))
                            }
                            
                            HStack(alignment: .lastTextBaseline, spacing: 2) {
                                Text("計 ")
                                    .font(.system(size: 14))
                                Text("\(0)")
                                    .font(.system(size: 22, weight: .bold))
                                Text(" 枚")
                                    .font(.system(size: 14))
                            }
                            .foregroundColor(.black)
                            
                            Button(action: {
                            }) {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 28))
                            }
                        }
                    }
                }
                .padding(10)
            }
        }
    }
}
