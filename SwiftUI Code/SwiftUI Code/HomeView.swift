//
//  HomeView.swift
//  SwiftUI Code
//
//  Created by phoenix Dai on 2020/3/6.
//  Copyright © 2020 phoenix Dai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
               HStack {
                   Text("Watching")
                       .font(.system(size: 28, weight: .bold))
                               
                   Spacer()
                           
                   PhoenixView(showProfile: $showProfile)
                Button(action: {self.showUpdate.toggle() }) {
                Image(systemName: "bell")
                    .renderingMode(.original)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
               
                .sheet(isPresented: $showUpdate) {
                    DiaryList()
                }
               }
               .padding(.horizontal)
               .padding(.leading , 14)
               .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchingRingView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }

                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20){
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10.0, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                .padding(30)
                .padding(.bottom,30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -60)
               Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height : CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.logo)
                
            }
            Text(section.text.uppercased())
                .frame(maxWidth:.infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 25)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "My first designs in SwiftUI", text: "copy to exceed", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color("card1")),
    Section(title: "Buid an app with SwiftUI", text: "let's do it", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color("card2")),
    Section(title: "SwiftUI is really convient", text: "happy to use", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))),
    
]


struct WatchingRingView: View {
    var body: some View {
        HStack(spacing: 40) {
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), color2: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), width: 44, height: 44, percent: 68, show: .constant(true))
                VStack(alignment: .leading,spacing: 4.0) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today").modifier(FontModifier(style: .caption))
                }
                .modifier(FontModifier())
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), color2: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), width: 44, height: 44, percent: 45, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), color2: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), width: 44, height: 44, percent: 82, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
