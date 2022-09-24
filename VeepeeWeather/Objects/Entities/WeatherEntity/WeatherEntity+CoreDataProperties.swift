//
//  WeatherEntity+CoreDataProperties.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 24/09/2022.
//
//

import Foundation
import CoreData

extension WeatherEntity {

  @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
    return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
  }

  @NSManaged public var date: Date?
  @NSManaged public var icon: String?
  @NSManaged public var info: String?
  @NSManaged public var temp: Double
  @NSManaged public var tempMax: Double
  @NSManaged public var tempMin: Double
  @NSManaged public var type: String?
  @NSManaged public var cities: CityEntity?
}
