import Foundation
import LocaleAuthentication
import UIKit

override func viewDidLoad() {
    super.viewDidLoad()

    createButton()

}

private func createButton() { 
  let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
  view.addSubview(button)
  button.center = view.center
  button.setTitle("Authorize", for: .normal)
  button.backgroundColor = .systemGreen
  button.addTarget(self, action: #selector(didTapAuthorizeButton), for: .touchUpInside)
}

// MARK: Actions

@objc func didTapAuthorizeButton() {
    let context = LAContext()
    var error: NSError? = nil
    if context.canEvaluatePolicy(.deviceOwnerAuthenticaionWithBiometrics, error: &error) {
        let reason = "Please authorize with touch id!"
        context.evaluatePolicy(.deviceOwnerAuthenticaionWithBiometrics, localizedReason: reason) { [weak self] success, error in 
            guard success, error == nil else {
                // failed
                showAlert(for: "Failed to Authenticate", message: "Please try again!")
                return
            }
            // Show other screen
            // Success
            let vc = UIViewController()
            vc.title = "Welcome!"
            vc.view.backgroundColor = .systemBlue
            self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        }

    } else {
        // can not use
        showAlert(for: "Unavailable", message: "You can't use this feature")
    }
}

func showAlert(for reason: String, message: String) {
    let alert = UIAlertController(title: reason, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    present(alert, animated: true)
}

// IMPORTANT
/*
PLEASE DON'T FORGET TO UPDATE THE INFO.PLIST WITH: Privacy - Face ID Usage Description and put your message there.

To test on simulator, go to feature, Face ID - Enrolled( to activate it) - Matching Face (to match) - Non-matching (to not match)
*/




