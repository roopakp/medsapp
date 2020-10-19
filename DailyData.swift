//
//  DailyData.swift
//  MEDS App
//
//  Created by Roopak Phatak on 9/18/20.
//  Copyright © 2020 Roopak Phatak. All rights reserved.
//

import UIKit
class DailyData{
    var meditation: String
    var exercise: String
    var diet: String
    var sleep: String
    init(meditation: String, exercise: String, diet: String, sleep: String) {
        self.meditation = meditation
        self.exercise = exercise
        self.diet = diet
        self.sleep = sleep
    }
}
