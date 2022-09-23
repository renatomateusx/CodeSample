import Cartography
import Foundation
import FPSTheme
import UIKit

public protocol SwitchComponentDelegate: AnyObject {
    func switchValueDidChange(switchComponent: SwitchComponent)
}

public final class SwitchComponent: UIView {
    private var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = FPSBranding.colorPalette.primaryBlack.color
        view.layer.cornerRadius = Constants.lineViewCornerRadius
        view.layer.borderWidth = Constants.circleViewBorderWidth
        return view
    }()

    private var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = FPSBranding.colorPalette.primaryBlack.color
        view.layer.borderColor = FPSBranding.colorPalette.primaryWhite.color.cgColor
        view.layer.borderWidth = Constants.circleViewBorderWidth
        view.layer.cornerRadius = Constants.circleViewCornerRadius
        view.clipsToBounds = true
        return view
    }()

    let constraintGroup = ConstraintGroup()

    public var isEnabled: Bool = true {
        didSet {
            setCircleViewState()
        }
    }

    private let shouldAddTapGesture: Bool

    public weak var delegate: SwitchComponentDelegate?

    public init(shouldAddTapGesture: Bool = false) {
        self.shouldAddTapGesture = shouldAddTapGesture
        super.init(frame: .zero)
        configureView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }

    private func configureView() {
        backgroundColor = .clear
        addSubviews()
        defineSubviewConstraints()
        if shouldAddTapGesture {
            isUserInteractionEnabled = true
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapSwitch)))
        }
    }

    private func addSubviews() {
        add(lineView, circleView)
    }

    private func defineSubviewConstraints() {
        Cartography.constrain(self, lineView, circleView) { superview, lineView, circleView in
            lineView.leading == superview.leading
            lineView.trailing == superview.trailing
            lineView.height == Constants.lineViewHeight

            circleView.centerY == lineView.centerY
            circleView.top == superview.top
            circleView.bottom <= superview.bottom
            circleView.height == Constants.circleViewHeight
            circleView.width == circleView.height

            superview.width == Constants.viewWidth
        }
        
        setCircleViewState()
    }

    @objc
    func didTapSwitch() {
        isEnabled.toggle()
        delegate?.switchValueDidChange(switchComponent: self)
    }

    private func setCircleViewState() {
        if isEnabled {
            Cartography.constrain(self, circleView, replace: constraintGroup) { superview, circleView in
                circleView.trailing == superview.trailing - Constants.cicleSpacing
            }
            lineView.backgroundColor = FPSBranding.colorPalette.primaryBlack.color
            lineView.layer.borderColor = FPSBranding.colorPalette.primaryBlack.color.cgColor
            circleView.backgroundColor = FPSBranding.colorPalette.primaryWhite.color
        } else {
            Cartography.constrain(self, circleView, replace: constraintGroup) { superview, circleView in
                circleView.leading == superview.leading + Constants.cicleSpacing
            }
            lineView.backgroundColor = FPSBranding.colorPalette.primaryWhite.color
            circleView.backgroundColor = FPSBranding.colorPalette.iconLightGrey.color
            lineView.layer.borderColor = FPSBranding.colorPalette.iconLightGrey.color.cgColor
        }

        UIView.animate(withDuration: 0.2, animations: layoutIfNeeded)
    }

    enum Constants {
        static let lineViewHeight: CGFloat = 28
        static let circleViewHeight: CGFloat = 24
        static let circleViewCornerRadius: CGFloat = circleViewHeight / 2
        static let circleViewBorderWidth: CGFloat = 1
        static let cicleSpacing: CGFloat = 2
        static let viewWidth: CGFloat = 48
        static let lineViewCornerRadius: CGFloat = 14

    }
}
