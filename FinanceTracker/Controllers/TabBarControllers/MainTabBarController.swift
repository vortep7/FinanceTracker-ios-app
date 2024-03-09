import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
        
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: GeneralViewController(), title: "Home", image: UIImage(systemName: "dollarsign.circle")),
            generateVC(viewController: ExchangeViewController(), title: "Stocks", image: UIImage(systemName: "globe.americas.fill")),
            generateVC(viewController: StatisticViewController(), title: "History", image: UIImage(systemName: "chart.pie.fill"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    //thanks to bezier line
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2

        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.backgroundColor = UIColor.white.cgColor
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = UIColor.tabBarItemAccent
        tabBar.unselectedItemTintColor = UIColor.tabBarItemLight
    }
}
