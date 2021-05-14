//
//  Home.swift
//  AMPlayer (iOS)
//
//  Created by Matthew Peters on 5/10/21.
//

import SwiftUI

struct Home: View {
    // Storing Current Tab...
    @State var selectedTab = "house.fill"
    
    // Volume...
    @State var volume: CGFloat = 0.4
    
    var body: some View{

        HStack(spacing: 0){
            
            let lightWhite = Color.white.opacity(0.7)
            // Side Tab Bar
            VStack{
                
                Image("spotify")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                VStack{
                    
                    TabButton(image: "house.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "safari.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "mic.fill", selectedTab: $selectedTab)
                    
                    TabButton(image: "clock.fill", selectedTab: $selectedTab)
                }
                
                    // setting the tabs at half height so the remaining elements have vertical space
                    .frame(height: getRect().height / 2.3)
                    .padding(.top)
                
                Spacer(minLength: 50)
                
                Button(action: {
                    // checking and increasing volume...
                    volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
                }, label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                
                // Custom Volume Progress View...
                GeometryReader{proxy in
                    
                    // extracting progress bar height and calculating the progress value...
                    let height = proxy.frame(in: .global) .height
                    let progress = height * volume
                    
                    ZStack(alignment: .bottom){
                        Capsule()
                            .fill(Color.gray.opacity(0.6))
                            .frame(width: 4)
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 4, height: progress)
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
                }
                
                .padding(.vertical, 20)
                
                Button(action: {
                    // checking and decreasing volume...
                    volume = volume - 0.1 > 0 ? volume - 0.1 : 0
                }, label: {
                    Image(systemName: "speaker.wave.1.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(lightWhite)
                })
                .padding(.top, 30)
                .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            }
            // Max side sidebar width...
            .frame(width: 80)
            .background(Color.black.ignoresSafeArea())
            // .offset(x: showSideBar ? 0 : -100)
            
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
        
        Button(action: {
            withAnimation{selectedTab = image}
        }, label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selectedTab == image ? .white : Color.gray.opacity(0.6))
                .frame(maxHeight: .infinity)
        })
    }
}

// Extending View to get screen size...
extension View {
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    // getting safe area...
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets
            ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
