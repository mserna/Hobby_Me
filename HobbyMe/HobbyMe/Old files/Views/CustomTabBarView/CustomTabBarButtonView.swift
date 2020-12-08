//
//  CustomTabBarButtonView.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/6/20.
//

import UIKit

class CustomTabBarButtonView: UIView {
    
    fileprivate static let nibName = "CustomTabBarButtonView"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectionIndicatorViewHeightLayoutConstraint: NSLayoutConstraint!
    
    weak var delegate: CustomTabBarButtonViewDelegate?
    
    /// Indicates if the tab bar view is selected.
    /// Setting this value is the same as calling `setIsSelected(_:animated:completion:)` with no animation or completion block.
    var isSelected: Bool {
        set {
            setIsSelected(newValue)
        }
        get {
            return _isSelected
        }
    
    }
    
    /// Private storage of the selection state. Most callers should instead use the `isSelected` property.
    fileprivate var _isSelected: Bool = false
    
    
    // MARK: - UIView lifecycle
    
    override init(frame: CGRect) {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            super.init(frame: frame)
        } else {
            preconditionFailure("Use `instance` instead")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Creates a new `CustomTabBarButtonView` instance.
    ///
    /// - Parameters:
    ///   - tabBarItem: The `UITabBarItem` the new instance will represent.
    ///   - delegate: The delegate this button will inform of delegate events.
    /// - Returns: The new instance.
    static func instance(for tabBarItem: UITabBarItem, delegate: CustomTabBarButtonViewDelegate) -> CustomTabBarButtonView {
        let buttonView = UINib(nibName: CustomTabBarButtonView.nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomTabBarButtonView
        
        buttonView.imageView.image = tabBarItem.image?.withRenderingMode(.alwaysTemplate)
        buttonView.delegate = delegate
        
        // Configure the view to be unselected (first toggle it to selected temporary so we can use the normal setter)
        buttonView._isSelected = true
        buttonView.setIsSelected(false)
        
        return buttonView
    }
    
    
    // MARK: - Selection
    
    /// Sets the selection state of the button, optionally animated.
    ///
    /// - Parameters:
    ///   - isSelected: The new isSelected value. Requests to set the value to the existing value are ignored.
    ///   - animated: `true` if the change should be animated.
    ///   - completion: A completion block called when the animation is complete.
    func setIsSelected(_ isSelected: Bool, animated: Bool = false, completion: (() -> Void)? = nil) {
        guard isSelected != self.isSelected else {
            return
        }
        _isSelected = isSelected
        
        let selectionChange = {
            self.imageView.tintColor = UIColor.blue
            self.selectionIndicatorViewHeightLayoutConstraint.constant = isSelected ? 8 : 0
            self.layoutIfNeeded()
        }
        
        // Do the update, animated or not
        if !animated {
            selectionChange()
            completion?()
            
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: isSelected ? .curveEaseIn : .curveEaseOut, animations: selectionChange) { (_) in
                completion?()
            }
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.didTap(tabBarButtonView: self)
    }
}


// MARK: - CustomTabBarButtonViewDelegate

protocol CustomTabBarButtonViewDelegate: class {
    
    /// Notifies the delegate that the `CustomTabBarButtonView` was tapped.
    ///
    /// - Note: The view does not change its selection status on tap.
    ///
    /// - Parameter tabBarButtonView: The button view that was tapped.
    func didTap(tabBarButtonView: CustomTabBarButtonView)
}
