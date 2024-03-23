//
//  FlagsView.swift
//  Flags
//
//  Created by Лидия Некрасова on 23.03.2024.
//

import SwiftUI

/// Вью модуля отображения бесконечной прокрутки флагов
struct FlagsView: View {
    
    // MARK: - Constants
    
    enum Constant {
        static let squareSize: CGFloat = 100
        static let duration: CGFloat = 1.5
        static let borderWidth: CGFloat = 2
        static let buttonHeight: CGFloat = 40
        static let fontSize: CGFloat = 80
    }
    
    // MARK: - Properties
    
    @StateObject var viewModel = FlagsViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: Constant.squareSize,
                           height: Constant.squareSize)
                    .foregroundColor(.clear)
                    .overlay {
                        VStack(spacing: .zero) {
                            
                            ForEach(viewModel.flags, id: \.self) { flag in
                                
                                Text(flag)
                                    .font(.system(size: Constant.fontSize))
                                    .frame(width: Constant.squareSize,
                                           height: Constant.squareSize)
                                    .offset(y: viewModel.offsetY)
                            }
                        }
                    }
                    .border(.black,
                            width: Constant.borderWidth)
            }
            .clipped()
            
            Spacer()

            Button(action: {
                viewModel.loadMore()
                
                withAnimation(.easeInOut(duration: Constant.duration)) {
                    viewModel.offsetY -= Constant.squareSize
                }
            }) {
                Text(viewModel.buttonTitle)
                    .frame(maxWidth: .infinity,
                           maxHeight: Constant.buttonHeight)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear{
            viewModel.transition()
        }
    }
}

// MARK: - PreviewProvider

struct FlagsView_Previews: PreviewProvider {
    static var previews: some View {
        FlagsView()
    }
}
