//
//  AppIntent.swift
//  WeatherWidget
//
//  Created by Sean on 1/22/25.
//

import WidgetKit
import AppIntents

struct WeatherLocation: AppEntity {
    let locationData: LocationDate
    
    var id: UUID { UUID() }
    var name: String { locationData.city }
    
    static var typeDisplayName: LocalizedStringResource = "Weather Location"
    static var defaultQuery = WeatherLocationQuery()
    
    // TypeDisplayRepresentable 프로토콜 요구사항
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(name: "Weather Location")
    }
    
    // InstanceDisplayRepresentable 프로토콜 요구사항
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(locationData.city)",
                              subtitle: "") // 필요한 경우 부제목 추가
    }
}

struct WeatherLocationQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [WeatherLocation] {
        
    }
    
    func suggestedEntities() async throws -> some ResultsCollection {
        [
            
        ]
    }
}

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    @Parameter(title: "Location", default: WeatherLocation(locationData: LocationDate.london))
    var location: WeatherLocation
}
