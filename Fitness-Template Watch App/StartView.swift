//
//  ContentView.swift
//  Fitness-Template Watch App
//
//  Created by Brady Phelps on 7/17/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]
    
    
    var body: some View {
        NavigationStack {
            List(workoutTypes) { workoutType in
                NavigationLink(workoutType.name, value: workoutType)
            }
            .navigationDestination(for: HKWorkoutActivityType.self) { workoutType in
                SessionPagingView()
            }
        }        .listStyle(.carousel)
        .navigationBarTitle("Workouts")
        .listStyle(.carousel)
        .navigationBarTitle("Workouts").onAppear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WorkoutManager())
    }
}
extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}
