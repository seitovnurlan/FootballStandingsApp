//
//  FavouritesManager.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 10/8/23.
//

import Foundation

class FavouritesManager {
    
    static let shared = FavouritesManager()
    
    private var favourites: [Datum] = []
    
    func addToFavourites(_ item: Datum) {
        if !favourites.contains(where: { $0.id == item.id }) {
            favourites.append(item)
        }
    }
    
    func removeFromFavourites(_ item: Datum) {
        if let index = favourites.firstIndex(where: { $0.id == item.id }) {
            favourites.remove(at: index)
        }
    }
    
    func isFavourite(_ item: Datum) -> Bool {
        return favourites.contains(where: { $0.id == item.id })
    }
    
    func getFavourites() -> [Datum] {
        return favourites
    }
}
