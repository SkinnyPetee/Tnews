//
//  NewsCardDeck.swift
//  Tnews
//
//  Created by sriram on 23/05/18.
//  Copyright © 2018 sriram. All rights reserved.
//

import Foundation

struct NewsCardDeeck  {
    
    
    var mainDeck = [NewsCard]()
    
    var subDeck = [NewsCard]()
    
    
    
    mutating func addToMainDeck(newsCard : NewsCard) {
        
        mainDeck.append(newsCard)
        
    }
    
    mutating func addToSubDeck(newsCard : NewsCard) {
        subDeck.append(newsCard)
    }
    
    mutating func removeFromMainDeck() -> NewsCard {
        let newsCard = mainDeck.removeLast()
        return newsCard
    }
    
    mutating func removeFromSubDeck() -> NewsCard {
        let newsCard = subDeck.removeLast()
        return newsCard
    }
}
