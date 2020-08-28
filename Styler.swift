//
//  Styler.swift
//  Arkade
//
//  Created by user on 14.02.2020.
//  Copyright © 2020 ArkadeGames. All rights reserved.
//

import UIKit

/// Wrapper around `NSMutableAttributedString`
final class Styler {
    
    // MARK: - Properties
    
    /// Use this value to assign final `NSMutableAttributedString` value to your view
    let attributedString: NSMutableAttributedString
    
    // MARK: - Initializer
    
    /// - Parameters:
    ///   - str: String to what you will configure styling
    ///   - styleCompletion: sync completion in which you should configure `NSMutableAttributedString`
    init(string str: String, styleCompletion: (Styler) -> Void) {
        self.attributedString = NSMutableAttributedString(string: str)
        styleCompletion(self)
    }
    
    /// - Parameters:
    ///   - url: Path to document
    ///   - options: Define document type
    ///   - styleCompletion: sync completion in which you should configure `NSMutableAttributedString`
    init(url: URL, options: [NSAttributedString.DocumentReadingOptionKey: Any], styleCompletion: (Styler) -> Void) throws {
        self.attributedString = try NSMutableAttributedString(url: url, options: options, documentAttributes: nil)
        styleCompletion(self)
    }
    
    // MARK: - Public API
    
    func appendAdditionalStyle(_ style: Styler) {
        attributedString.append(style.attributedString)
    }
    
    func foreground(color: UIColor) {
        attributedString.foreground(color: color)
    }
    
    func font(_ font: UIFont) {
        attributedString.font(font)
    }
    
    func paragraph(lineSpacing: CGFloat, alignment: NSTextAlignment = .center) {
        attributedString.paragraph(lineSpacing: lineSpacing, alignment: alignment)
    }
    
    func underline(style: NSUnderlineStyle) {
        attributedString.underline(style: style)
    }
}

// MARK: - Private NSMutableAttributedString extension

private extension NSMutableAttributedString {
    func foreground(color: UIColor) {
        addAttribute(.foregroundColor, value: color, range: fullStringLengthRange)
    }
    
    func font(_ font: UIFont) {
        addAttribute(.font, value: font, range: fullStringLengthRange)
    }
    
    func paragraph(lineSpacing: CGFloat, alignment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        paragraphStyle.lineSpacing = lineSpacing
        addAttribute(.paragraphStyle, value: paragraphStyle, range: fullStringLengthRange)
    }
    
    func underline(style: NSUnderlineStyle) {
        addAttribute(.underlineStyle, value: style.rawValue, range: fullStringLengthRange)
    }
}

private extension NSMutableAttributedString {
    var fullStringLengthRange: NSRange {
        return (string as NSString).range(of: string)
    }
}
