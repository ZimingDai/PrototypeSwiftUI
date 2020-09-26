//
//  DiaryDetail.swift
//  SwiftUI Code
//
//  Created by phoenix Dai on 2020/3/8.
//  Copyright © 2020 phoenix Dai. All rights reserved.
//

import SwiftUI

struct DiaryDetail: View {
    var diary: Diary = diaryData[1]
    
    var body: some View {
        
        List {
            VStack {
                Image(diary.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                Text(diary.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(diary.title)
        }
    .listStyle(PlainListStyle())
    }
}

struct DiaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetail()
    }
}
