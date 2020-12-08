//
//  TabBarController.swift
//  HobbyMe
//
//  Created by HackinMac on 12/5/20.
//

import UIKit

class TabBarController: UITabBarController, CustomTabBarButtonViewDelegate {
    func didTap(tabBarButtonView: CustomTabBarButtonView) {
        // Get the index of the tapped item
        guard let tabIndex = customTabBarStackView.arrangedSubviews.firstIndex(of: tabBarButtonView) else {
            preconditionFailure("Error switching tabs")
        }
        
        // If user taps a tab bar button, return them to root view controller
        if let vc = self.viewControllers?[tabIndex] as? UINavigationController {
            vc.popToRootViewController(animated: true)
            
        }
        
        // Set the `selectedIndex` - note, we use `super` here so it doesn't trigger non-animated button selection changes.
        super.selectedIndex = tabIndex
        updateTabBarStackViewForSelectedIndex(animated: true)
        
        delegate?.tabBarController?(self, didSelect: selectedViewController!)
    }
    
    
    @IBOutlet var customTabBarContainer: UIView!
    
    @IBOutlet weak var customTabBarStackView: UIStackView!
    
    override var selectedIndex: Int {
        didSet {
            updateTabBarStackViewForSelectedIndex()
        }
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            updateTabBarStackViewForSelectedIndex()
        }
    }
    
    
    // MARK: - UIViewController/UITabBarController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the custom tab bar
        customTabBarContainer.translatesAutoresizingMaskIntoConstraints = false
        tabBar.addSubview(customTabBarContainer)
        customTabBarContainer.constrain(toFill: tabBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Change height of tabbar
        let tabbarHeight: CGFloat = 56.0 // Changed pixel height due to new phone screen height
        var tabFrame = tabBar.frame
        tabFrame.size.height = tabbarHeight
        tabFrame.origin.y = view.frame.size.height - tabbarHeight
        tabBar.frame = tabFrame
        
        // Bring our custom tab bar to the front of the other tab bar views
        tabBar.bringSubviewToFront(customTabBarContainer)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        // Clear out any existing tabButtonViews we were displaying
        customTabBarStackView.arrangedSubviews.forEach { (view) in
            customTabBarStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        // Add a new tabBarButtonView for each view controller
        tabBar.items?.forEach { (tabBarItem) in
            let tabBarButtonView = CustomTabBarButtonView.instance(for: tabBarItem, delegate: self)
            self.customTabBarStackView.addArrangedSubview(tabBarButtonView)

            // The first item is selected when setting view controllers, so update the first tab bar view
            if customTabBarStackView.arrangedSubviews.count == 1 {
                tabBarButtonView.setIsSelected(true)
            }
        }
    }
    
    // MARK: - Managing the selected custom tabbar item
    
    /// Updates the custom tab bar view selection state to reflect the current `selectedIndex`.
    ///
    /// - Parameter animated: `true` if the change should be animated.
    func updateTabBarStackViewForSelectedIndex(animated: Bool = false) {
        guard customTabBarStackView.arrangedSubviews.count > selectedIndex else {
            return
        }

        // Get the item that should be selected
        let selectedTabBarButtonView = customTabBarStackView.arrangedSubviews[selectedIndex]

        customTabBarStackView.arrangedSubviews.forEach { (view) in
            guard let tabView = view as? CustomTabBarButtonView else {
                return
            }
            tabView.setIsSelected(selectedTabBarButtonView == view, animated: animated)
        }
    }
}


// MARK: - CustomTabBarButtonViewDelegate

//extension TabBarController: CustomTabBarButtonViewDelegate {
//
//    func didTap(tabBarButtonView: CustomTabBarButtonView) {
//
//        // Get the index of the tapped item
//        guard let tabIndex = customTabBarStackView.arrangedSubviews.index(of: tabBarButtonView) else {
//            preconditionFailure("Unable to determine tab to switch to")
//        }
//
//        // If user taps a tab bar button, return them to root view controller
//        if let vc = self.viewControllers?[tabIndex] as? UINavigationController {
//            vc.popToRootViewController(animated: true)
//
//        }
//
//        // Set the `selectedIndex` - note, we use `super` here so it doesn't trigger non-animated button selection changes.
//        super.selectedIndex = tabIndex
//        updateTabBarStackViewForSelectedIndex(animated: true)
//
//        delegate?.tabBarController?(self, didSelect: selectedViewController!)
//    }
//}
