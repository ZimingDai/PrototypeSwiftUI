//
//  CourseList.swift
//  SwiftUI Code
//
//  Created by phoenix Dai on 2020/3/12.
//  Copyright © 2020 phoenix Dai. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    
    var body: some View {
        VStack {
            CourseView()
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack (alignment: .leading, spacing: 30){
                Text("High school is a period of important time in our life, but I think it is really ugly.")
                Text("About this time")
                    .font(.title).bold()
                Text("When I walk alone on the log bridge\nFacing the darkness all around\nI can't resist\nThe strange eyes of others\nI don't know what to do\nAfter all, this single-log bridge\nIt was my own choice\nEvery step\nI have to be careful\nAccidentally\nFall into the sea under your feet\nI finished my\nGreat youth and years\nI don't know how long this single-log bridge is\nIt's always right to keep walking\nDo you believe in miracles?\nYeah, actually, I don't believe it either\nBut, I believe\nDon't give up the path you choose\nIn the end\nThere will be willow greens and bonuses\nWill reach the end of your heart")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("High School Summary")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.blue)
                        Text("a boring time")
                            .fontWeight(.medium)
                            .foregroundColor(Color.blue.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        frame(width: 36, height: 36)
                           .background(Color.black)
                           .clipShape(Circle())
                           .opacity(show ? 1 : 0)
                    }
                   
                }
                Spacer()
                Image(uiImage: #imageLiteral(resourceName: "Card3"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
    //        .frame(width: show ? screen.width : screen.width - 60, height:show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
            .background(Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)).opacity(0.4), radius: 20, x: 0, y: 20)
            
            .onTapGesture {
                self.show.toggle()
            }
           
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}
