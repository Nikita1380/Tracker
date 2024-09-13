import UIKit

final class TabBarViewController: UITabBarController {
    
    private let trackersVC = TrackersViewController()
    private let statisticVC = StatisticViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSettings()
    }
    
    private func tabBarSettings() {
        
        // - Настройка панели tab bar
        tabBar.barTintColor = .black
        tabBar.clipsToBounds = true
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor(red:0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha:0.2).cgColor
        
        let trackerNVC = UINavigationController(rootViewController: trackersVC)
        trackerNVC.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: UIImage(named: "tab_tracker_active"),
            selectedImage: nil
        )

        statisticVC.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: UIImage(named: "tab_statistic_inactive"),
            selectedImage: nil
        )

        viewControllers = [trackerNVC, statisticVC]
    }
}
