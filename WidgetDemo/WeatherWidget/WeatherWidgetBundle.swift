//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by Sean on 1/22/25.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetControl()
        WeatherWidgetLiveActivity()
    }
}
