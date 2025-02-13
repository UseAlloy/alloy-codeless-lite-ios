import Foundation

public struct CustomTheme: Codable {
    public var primaryColor: String?
    public var backgroundColor: String?
    public var textColor: String?
    public var borderRadius: String?
    public var iconColor: String?
    public var successColor: String?
    public var errorColor: String?
    public var fontFamily: String?
    public var wideMobileButtons: Bool?
    public var alignContentStart: Bool?
    public var hidePreviousButtonIcon: Bool?
    
    public init(primaryColor: String? = nil, backgroundColor: String? = nil, textColor: String? = nil, borderRadius: String? = nil, iconColor: String? = nil, successColor: String? = nil, errorColor: String? = nil, fontFamily: String? = nil, wideMobileButtons: Bool? = nil, alignContentStart: Bool? = nil, hidePreviousButtonIcon: Bool? = nil) {
        self.primaryColor = primaryColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderRadius = borderRadius
        self.iconColor = iconColor
        self.successColor = successColor
        self.errorColor = errorColor
        self.fontFamily = fontFamily
        self.wideMobileButtons = wideMobileButtons
        self.alignContentStart = alignContentStart
        self.hidePreviousButtonIcon = hidePreviousButtonIcon
    }
}

public struct ComponentOverride: Codable {
    public var PrimaryButton: ButtonState?
    public var ExitButton: ButtonState?
    public var PictureButton: ButtonState?
    public var SelectorButton: SelectorButtonState?
    public var Header: HeaderState?
    public var HelpBanner: HelpBannerState?
    public var PhoneInput: PhoneInputState?
    public var PreviousButton: ButtonState?
    
    public init(PrimaryButton: ButtonState? = nil, ExitButton: ButtonState? = nil, PictureButton: ButtonState? = nil, SelectorButton: SelectorButtonState? = nil, Header: HeaderState? = nil, HelpBanner: HelpBannerState? = nil, PhoneInput: PhoneInputState? = nil, PreviousButton: ButtonState? = nil) {
        self.PrimaryButton = PrimaryButton
        self.ExitButton = ExitButton
        self.PictureButton = PictureButton
        self.SelectorButton = SelectorButton
        self.Header = Header
        self.HelpBanner = HelpBanner
        self.PhoneInput = PhoneInput
        self.PreviousButton = PreviousButton
    }
}

public struct ButtonState: Codable {
    public var `default`: ButtonStyle?
    public var hover: ButtonStyle?
    public var focus: ButtonStyle?
    
    public init(default: ButtonStyle? = nil, hover: ButtonStyle? = nil, focus: ButtonStyle? = nil) {
        self.default = `default`
        self.hover = hover
        self.focus = focus
    }
}

public struct SelectorButtonState: Codable {
    public var `default`: SelectorButtonStyle?
    public var hover: SelectorButtonStyle?
    public var focus: SelectorButtonStyle?
    
    public init(default: SelectorButtonStyle? = nil, hover: SelectorButtonStyle? = nil, focus: SelectorButtonStyle? = nil) {
        self.default = `default`
        self.hover = hover
        self.focus = focus
    }
}

public struct HeaderState: Codable {
    public var `default`: HeaderStyle?
    
    public init(default: HeaderStyle? = nil) {
        self.default = `default`
    }
}

public struct HelpBannerState: Codable {
    public var `default`: HelpBannerStyle?
    
    public init(default: HelpBannerStyle? = nil) {
        self.default = `default`
    }
}

public struct PhoneInputState: Codable {
    public var `default`: PhoneInputStyle?
    
    public init(default: PhoneInputStyle? = nil) {
        self.default = `default`
    }
}

public struct ButtonStyle: Codable {
    public var backgroundColor: String?
    public var textColor: String?
    public var borderRadius: String?
    public var border: String?
    public var boxShadow: String?
    
    public init(backgroundColor: String? = nil, textColor: String? = nil, borderRadius: String? = nil, border: String? = nil, boxShadow: String? = nil) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderRadius = borderRadius
        self.border = border
        self.boxShadow = boxShadow
    }
}

public struct SelectorButtonStyle: Codable {
    public var iconColor: String?
    public var backgroundColor: String?
    public var textColor: String?
    public var borderRadius: String?
    public var border: String?
    public var boxShadow: String?
    
    public init(iconColor: String? = nil, backgroundColor: String? = nil, textColor: String? = nil, borderRadius: String? = nil, border: String? = nil, boxShadow: String? = nil) {
        self.iconColor = iconColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderRadius = borderRadius
        self.border = border
        self.boxShadow = boxShadow
    }
}

public struct HeaderStyle: Codable {
    public var backgroundColor: String?
    public var textColor: String?
    public var border: String?
    public var boxShadow: String?
    public var borderRadius: String?
    
    public init(backgroundColor: String? = nil, textColor: String? = nil, border: String? = nil, boxShadow: String? = nil, borderRadius: String? = nil) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.border = border
        self.boxShadow = boxShadow
        self.borderRadius = borderRadius
    }
}

public struct HelpBannerStyle: Codable {
    public var backgroundColor: String?
    public var textColor: String?
    public var border: String?
    public var boxShadow: String?
    public var borderRadius: String?
    public var iconColor: String?
    
    public init(backgroundColor: String? = nil, textColor: String? = nil, border: String? = nil, boxShadow: String? = nil, borderRadius: String? = nil, iconColor: String? = nil) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.border = border
        self.boxShadow = boxShadow
        self.borderRadius = borderRadius
        self.iconColor = iconColor
    }
}

public struct PhoneInputStyle: Codable {
    public var backgroundColor: String?
    public var textColor: String?
    public var border: String?
    public var boxShadow: String?
    public var borderRadius: String?
    
    public init(backgroundColor: String? = nil, textColor: String? = nil, border: String? = nil, boxShadow: String? = nil, borderRadius: String? = nil) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.border = border
        self.boxShadow = boxShadow
        self.borderRadius = borderRadius
    }
}
