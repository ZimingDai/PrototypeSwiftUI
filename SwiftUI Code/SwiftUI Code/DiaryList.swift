//
//  UpdateList.swift
//  SwiftUI Code
//
//  Created by phoenix Dai on 2020/3/8.
//  Copyright © 2020 phoenix Dai. All rights reserved.
//

import SwiftUI

struct DiaryList: View {
    @ObservedObject var store = DiaryStore()
    
    func addDiary() {
        store.diaries.append(Diary(image: "Card1", title: "new item", text: "text", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.diaries) { diary in
                    NavigationLink(destination: DiaryDetail(diary: diary)) {
                        HStack {
                            Image(diary.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text(diary.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(diary.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(diary.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.diaries.remove(at: index.first!)
                }
                .onMove { (sourse: IndexSet, destination: Int) in
                    self.store.diaries.move(fromOffsets: sourse, toOffset: destination)
                }
            }
        .navigationBarTitle(Text("Diaries"))
        .navigationBarItems(leading: Button(action: addDiary) {
            Text("Add Diary")
        }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        DiaryList()
    }
}

struct Diary: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let diaryData = [
    Diary(image: "Card1", title: "Why did I do", text: "Today, I had to finish my teacher's homework which is about the Data Structure. It was not very hard. But I met some problems that I can't do with. Today is deadline day. If I had done it, it would be great.", date: "March 8"),
    Diary(image: "Card2", title: "Virus made me mad", text: "Nowadays, China is surrounded by the 2019-nCoV virus. It is so dangerous that Chinese people must stay at home. We can't go walking, go shopping and pay a vist to our neighbors. Whole days are boring! God!!", date: "March 6"),
    Diary(image: "Card3", title: "Homework kill me", text: "Homework, homework and homework! It is eternal. It is horrible! ***.", date: "Feb 29"),
    Diary(image: "Card4", title: "None is the best", text: "Today, nothing happened. We still live on the earth. We still eat, play, waste our treasure time. Silly people.", date: "Feb 25"),
    Diary(image: "Card5", title: "Time to study", text: "The holiday is slipping away. Cources are going to begin. Even though we are not able to go to the univercity, the school seems not to let us go.", date: "Feb 17")
]

