import UIKit
import Foundation

struct Stocks {
    var name: String
    var title: String
    var price: Float
    var Image: UIImage
}

class ConfigStocks {
    static let shared = ConfigStocks()
    private var exchangeStorage = [String:Double]()
    private var exchangeStorageDate: String?
    private var moneyTitleStorage: MoneyModel?
    
    var myArray = [Stocks]()
    
    var firstFlag = false
    var secondFlag = false

    func requestForCollection() {
        NetworkManager.shared.fetchDataExchange { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                self.exchangeStorage = data.eur
                self.exchangeStorageDate = data.date
                self.firstFlag = true
                self.checkCollectionReady()
            case .failure(let error):
                print(error)
            }
        }
        
        NetworkManager.shared.fetchDataMoney { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                self.moneyTitleStorage = data
                self.secondFlag = true
                self.checkCollectionReady()
            case .failure(let error):
                print(error)
            }
        }
    }

    private func checkCollectionReady() {
        if firstFlag && secondFlag {
            self.collectionSource()
        }
    }
    
    func collectionSource(){
        let dataArray = [
            Stocks(name: moneyTitleStorage!.aud, title: moneyTitle.aud.rawValue, price: Float(exchangeStorage["aud"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.btc, title: moneyTitle.btc.rawValue, price: Float(exchangeStorage["btc"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.cny, title: moneyTitle.cny.rawValue, price: Float(exchangeStorage["cny"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.eth, title: moneyTitle.eth.rawValue, price: Float(exchangeStorage["eth"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.eur, title: moneyTitle.eur.rawValue, price: Float(exchangeStorage["eur"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.gbp, title: moneyTitle.gbp.rawValue, price: Float(exchangeStorage["gbp"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.jpy, title: moneyTitle.jpy.rawValue, price: Float(exchangeStorage["jpy"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.rub, title: moneyTitle.rub.rawValue, price: Float(exchangeStorage["rub"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.sol, title: moneyTitle.sol.rawValue, price: Float(exchangeStorage["sol"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.usd, title: moneyTitle.usd.rawValue, price: Float(exchangeStorage["usd"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.usdt, title: moneyTitle.usdt.rawValue, price: Float(exchangeStorage["usdt"]!), Image: UIImage(named: "btc")!),
            Stocks(name: moneyTitleStorage!.luna, title: moneyTitle.luna.rawValue, price: Float(exchangeStorage["luna"]!), Image: UIImage(named: "btc")!),
        ]
        self.myArray = dataArray
    }
}


enum moneyTitle: String {
    case aud = "The Australian Dollar (AUD) is the official currency of Australia and its territories. It is one of the most traded currencies in the world."
    case btc = "Bitcoin (BTC) is a decentralized digital currency, without a central bank or single administrator, that can be sent from user to user on the peer-to-peer bitcoin network without the need for intermediaries."
    case cny = "The Chinese Yuan (CNY) is the official currency of China. It is issued by the People's Bank of China, the monetary authority of the People's Republic of China."
    case eth = "Ethereum (ETH) is a decentralized, open-source blockchain system that features smart contract functionality. It is the second-largest cryptocurrency by market capitalization, after Bitcoin."
    case eur = "The Euro (EUR) is the official currency of the Eurozone, which consists of 19 of the 27 member states of the European Union."
    case gbp = "The British Pound (GBP) is the official currency of the United Kingdom and its territories. It is one of the oldest currencies still in use today."
    case jpy = "The Japanese Yen (JPY) is the official currency of Japan. It is the third most traded currency in the foreign exchange market after the United States dollar and the Euro."
    case rub = "The Russian Ruble (RUB) is the official currency of Russia and its territories. It is the world's second-most-used currency after the United States dollar."
    case sol = "The Sol (SOL) is the official currency of Peru. It is issued by the Central Reserve Bank of Peru and has the ISO 4217 currency code PEN."
    case usd = "The United States Dollar (USD) is the official currency of the United States and its territories. It is the world's primary reserve currency."
    case usdt = "Tether (USDT) is a type of cryptocurrency called a stablecoin. It is designed to always be worth $1.00, maintaining a 1:1 peg with the US dollar through a reserve backing of USD assets."
    case luna = "Terra (LUNA) is the native cryptocurrency of the Terra blockchain platform, which aims to create a stablecoin ecosystem that powers the next-generation payment network for e-commerce and peer-to-peer transactions."
}

