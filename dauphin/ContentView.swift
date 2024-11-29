//
//  ContentView.swift
//  campuspass_ios
//
//  Created by \u8b19 on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AuthViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if #available(iOS 18.0, *) {
            TabView() {
                Tab("Course", systemImage: "calendar.day.timeline.left"){
                    CourseScheduleView(authViewModel: viewModel)
                }
                
                //Tab("Library", systemImage: "books.vertical.fill"){
                //    LibraryView(authViewModel: viewModel)
                //}
                
                //Tab("other", systemImage: "chart.line.text.clipboard"){
                //    OtherView()
                //}
                
                Tab("setting", systemImage: "gear") {
                    SettingView(viewModel: viewModel)
                }
                
            }
            
        } else {
            TabView {
                CourseScheduleView(authViewModel: viewModel)
                    .tabItem {
                        Label("Course", systemImage: "calendar.day.timeline.left")
                    }
                SettingView(viewModel: viewModel)
                    .tabItem {
                        Label("setting", systemImage: "gear")
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
