
import SwiftUI

extension Font {
    private enum FontFamily {
        static let roboto = "Roboto_Regular"
        static let bold = "Roboto-Bold"
    }

    static let robotoBold = Font.custom(FontFamily.bold, size: 21)
    static let robotoSubtitle = Font.custom(FontFamily.bold, size: 14)
    static let robotoBody = Font.custom(FontFamily.roboto, size: 16)
    static let robotoButton = Font.custom(FontFamily.bold, size: 16)
}
