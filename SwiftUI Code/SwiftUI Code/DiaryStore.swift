//
//  DiaryStore.swift
//  SwiftUI Code
//
//  Created by phoenix Dai on 2020/3/8.
//  Copyright © 2020 phoenix Dai. All rights reserved.
//

import SwiftUI
import Combine

class DiaryStore: ObservableObject {
    @Published var diaries: [Diary] = diaryData
}
