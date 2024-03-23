//
//  FlagsViewModel.swift
//  Flags
//
//  Created by Лидия Некрасова on 23.03.2024.
//

import Foundation

protocol FlagsViewModelProtocol: ObservableObject {
    var flags: [String] { get }
    var offsetY: CGFloat { get }
    var buttonTitle: String { get }
    
    func transition()
    func loadMore()
}

// View Model модуля отображения бесконечной прокрутки флагов
final class FlagsViewModel: FlagsViewModelProtocol {
    
    // MARK: - Properties
    
    @Published var flags: [String]
    @Published var offsetY: CGFloat = 0
    let buttonTitle: String = "Hit me!"
    
    // MARK: - Initializers
    
    init() {
        flags = Flags.getFlags().flags
    }
    
    // MARK: - Internal Methods
    
    func transition() {
        offsetY = CGFloat(flags.count / 2) * 100
    }
    
    func loadMore() {
        if offsetY == -CGFloat(flags.count / 2) * 100 + 100 {
            flags.append(flags.removeFirst())
            offsetY += 100
        }
    }
}
