//
//  CityEntity+CoreDataProperties.swift
//  VeepeeWeather
//
//  Created by Roland Lariotte on 25/09/2022.
//
//

import Foundation
import CoreData


extension CityEntity {

  @nonobjc public class func fetchRequest() -> NSFetchRequest<CityEntity> {
    return NSFetchRequest<CityEntity>(entityName: "CityEntity")
  }

  @NSManaged public var name: String?
  @NSManaged public var weathers: NSOrderedSet?

}

// MARK: Generated accessors for weathers
extension CityEntity {

  @objc(insertObject:inWeathersAtIndex:)
  @NSManaged public func insertIntoWeathers(_ value: WeatherEntity, at idx: Int)

  @objc(removeObjectFromWeathersAtIndex:)
  @NSManaged public func removeFromWeathers(at idx: Int)

  @objc(insertWeathers:atIndexes:)
  @NSManaged public func insertIntoWeathers(_ values: [WeatherEntity], at indexes: NSIndexSet)

  @objc(removeWeathersAtIndexes:)
  @NSManaged public func removeFromWeathers(at indexes: NSIndexSet)

  @objc(replaceObjectInWeathersAtIndex:withObject:)
  @NSManaged public func replaceWeathers(at idx: Int, with value: WeatherEntity)

  @objc(replaceWeathersAtIndexes:withWeathers:)
  @NSManaged public func replaceWeathers(at indexes: NSIndexSet, with values: [WeatherEntity])

  @objc(addWeathersObject:)
  @NSManaged public func addToWeathers(_ value: WeatherEntity)

  @objc(removeWeathersObject:)
  @NSManaged public func removeFromWeathers(_ value: WeatherEntity)

  @objc(addWeathers:)
  @NSManaged public func addToWeathers(_ values: NSOrderedSet)

  @objc(removeWeathers:)
  @NSManaged public func removeFromWeathers(_ values: NSOrderedSet)

}

extension CityEntity : Identifiable {
  // Intentionally empty
}
