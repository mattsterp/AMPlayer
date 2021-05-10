//
//  Home.swift
//  AMPlayer (iOS)
//
//  Created by Matthew Peters on 5/10/21.
//

import SwiftUI

struct Home: View {
    var body: some View{

        HStack(spacing: 0){
            
            // Side Tab Bar
            VStack{
                
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 45, height: 45)
                
                Spacer()
            }
            // Max side sidebar width...
            .frame(width: 80)
            .background(Color.black.ignoresSafeArea())
            
            // Main content...
            ScrollView(showsIndicators: false, content: {
            
            })
            .background(Color("bg").ignoresSafeArea())
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Tab Button...
struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: image)
            
        })
    }
}

