//
//  Product.swift
//  ProductsNestingUsingDecoder
//
//  Created by Mac on 15/10/22.
//

import Foundation

struct Product : Decodable
{
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : URL
    
    var rate : Float
    var count : Double
    
    enum CodingKeys: CodingKey
    {
        case id
        case title
        case price
        case description
        case category
        case image
        
        case rating
    }
    enum RatingKeys : CodingKey
    {
        case rate
        case count
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Double.self, forKey: .price)
        self.description = try container.decode(String.self, forKey: .description)
        self.category = try container.decode(String.self, forKey: .category)
        self.image = try container.decode(URL.self, forKey: .image)
        
        let ratingContainer = try container.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        self.rate = try ratingContainer.decode(Float.self, forKey: .rate)
        self.count = try ratingContainer.decode(Double.self, forKey: .count)
    }
}
