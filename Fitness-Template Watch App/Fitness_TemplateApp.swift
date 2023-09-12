//
//  Fitness_TemplateApp.swift
//  Fitness-Template Watch App
//
//  Created by Brady Phelps on 7/17/23.
//

import SwiftUI

@main
struct Fitness_Template_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }.environmentObject(workoutManager)
        }
    }
}
