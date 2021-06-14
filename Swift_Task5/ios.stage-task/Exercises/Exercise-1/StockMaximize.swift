import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var profit = 0
        var pricesMutable = prices
        var buyingPrices = [Int]()
        var profitTemp = 23456
        while profit != profitTemp || profitTemp == 0{
            if pricesMutable.count == 0 {
                print("break")
                break
            }
            buyingPrices = []
            profitTemp = profit
            var highestPriceIndex = pricesMutable.lastIndex(of:pricesMutable.max()!);
            var i = 0
            var highestPrice = pricesMutable[highestPriceIndex!]
            pricesMutable.remove(at: highestPriceIndex!)
            while i < highestPriceIndex! {
                buyingPrices.append(pricesMutable[0])
                pricesMutable.remove(at: 0)
                i += 1
            }
            profit += highestPriceIndex! * highestPrice - buyingPrices.reduce(0, +)
            print(profit)
        }
        return profit
    }
}
