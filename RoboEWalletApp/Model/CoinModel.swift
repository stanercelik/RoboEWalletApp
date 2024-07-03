import SwiftUI

struct CoinModel: Identifiable, Decodable {
    var id: String
    var name: String
    var code: String
    var price: String
    var change: Double
    var color: Color
    var softColor: Color
    var iconName: String
    var sparkline: [Double]?
    var rank: Int?
    var marketCap: String?
    var volume: String?

    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case code = "symbol"
        case price
        case change
        case iconName = "iconUrl"
        case colorHex = "color"
        case sparkline
        case rank
        case marketCap
        case volume = "24hVolume"
    }
    
    init(id: String, name: String, code: String, price: String, change: Double, color: Color, softColor: Color, iconName: String, sparkline: [Double]? = nil, rank: Int? = nil, marketCap: String? = nil, volume: String? = nil) {
        self.id = id
        self.name = name
        self.code = code
        self.price = price
        self.change = change
        self.color = color
        self.softColor = softColor
        self.iconName = iconName
        self.sparkline = sparkline
        self.rank = rank
        self.marketCap = marketCap
        self.volume = volume
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode(String.self, forKey: .code)
        
        let priceString = try container.decode(String.self, forKey: .price)
        if let priceValue = Double(priceString) {
            price = String(format: "%.4f", priceValue)
        } else {
            price = priceString
        }
        
        let changeString = try container.decode(String.self, forKey: .change)
        if let changeValue = Double(changeString) {
            change = changeValue
        } else {
            change = 0.0
        }

        iconName = try container.decode(String.self, forKey: .iconName)

        let colorHex = try container.decode(String.self, forKey: .colorHex)
        color = Color(hex: colorHex)
        softColor = color.opacity(0.2)
        
        if let sparklineStrings = try container.decodeIfPresent([String?].self, forKey: .sparkline) {
            sparkline = sparklineStrings.compactMap { Double($0 ?? "") }
        } else {
            sparkline = nil
        }
        rank = try container.decodeIfPresent(Int.self, forKey: .rank)
        marketCap = try container.decodeIfPresent(String.self, forKey: .marketCap)
        volume = try container.decodeIfPresent(String.self, forKey: .volume)
    }
}

struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}

struct CoinData: Decodable {
    let coins: [CoinModel]
}
