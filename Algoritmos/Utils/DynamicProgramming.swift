//
//  DynamicProgramming.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 6/2/23.
//

import Foundation

func buildDP<T>(xCount: Int, yCount: Int, initial: T) -> [[T]] {
    var dp: [[T]] = []

    for _ in 0...xCount {
        dp.append(Array(repeating: initial, count: yCount + 1))
    }

    return dp
}
