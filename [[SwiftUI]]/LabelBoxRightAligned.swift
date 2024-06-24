//
//  LabelBoxRightAligned.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/16/24.
//

import SwiftUI

struct LabelBoxRightAligned: View {
    
    let line1: String?
    let line2: String?
    let numberOfLines: Int
    let width: Int
    let height: Int
    let paddingLeft: Int
    let paddingRight: Int
    let paddingBottom: Int
    let lineHeight: Int
    let spacingVertical: Int
    let font: UIFont
    let color: Color
    init(line1: String?,
         line2: String?,
         numberOfLines: Int,
         width: Int,
         paddingLeft: Int,
         paddingRight: Int,
         paddingBottom: Int,
         lineHeight: Int,
         spacingVertical: Int,
         font: UIFont,
         color: Color) {
        self.line1 = line1
        self.line2 = line2
        self.numberOfLines = numberOfLines
        self.width = width
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
        self.paddingBottom = paddingBottom
        self.lineHeight = lineHeight
        self.spacingVertical = spacingVertical
        self.font = font
        self.color = color
        
        var _height = lineHeight + paddingBottom
        if numberOfLines == 2 {
            _height += (lineHeight + spacingVertical)
        }
        self.height = _height
    }
    
    var body: some View {
        return ZStack {
            if let line1 = line1 {
                if let line2 = line2 {
                    getBody(line1: line1, line2: line2)
                    
                } else {
                    getBody(line1: line1)
                    
                }
            } else if let line2 = line2 {
                getBody(line1: line2)
                
            } else {
                getBody()
            }
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
        .padding(.bottom, CGFloat(paddingBottom))
    }
    
    func getBody(line1: String, line2: String) -> some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingLeft), height: 12.0)
                    .background(Color(red: 0.75, green: 0.85, blue: 0.35))
#else
                Spacer()
                    .frame(width: CGFloat(paddingLeft))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                Text(line1)
                    .font(Font(font))
                    .fixedSize(horizontal: true, vertical: false)
                    //.frame(width: CGFloat(width), height: CGFloat(lineHeight))
                    .frame(height: CGFloat(lineHeight))
                    .foregroundColor(color)
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.87, green: 0.95, blue: 0.45)))
#endif
#if LABEL_HINTS
                    .overlay(Rectangle().foregroundColor(Color.white.opacity(0.5)).zIndex(3097.0))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingRight), height: 12.0)
                    .background(Color(red: 0.75, green: 0.35, blue: 0.85))
#else
                Spacer()
                    .frame(width: CGFloat(paddingRight))
#endif
                
            }
            .frame(width: CGFloat(width))
            .padding(.bottom, CGFloat(spacingVertical))
            
            HStack(spacing: 0.0) {
                
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingLeft), height: 12.0)
                    .background(Color(red: 0.75, green: 0.35, blue: 0.85))
#else
                Spacer()
                    .frame(width: CGFloat(paddingLeft))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                Text(line2)
                    .font(Font(font))
                    .fixedSize(horizontal: true, vertical: false)
                    //.frame(width: CGFloat(width), height: CGFloat(lineHeight))
                    .frame(height: CGFloat(lineHeight))
                    .foregroundColor(color)
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.87, green: 0.95, blue: 0.45)))
#endif
#if LABEL_HINTS
                    .overlay(Rectangle().foregroundColor(Color.white.opacity(0.5)).zIndex(3097.0))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingRight), height: 12.0)
                    .background(Color(red: 0.75, green: 0.85, blue: 0.35))
#else
                Spacer()
                    .frame(width: CGFloat(paddingRight))
#endif
            }
            .frame(width: CGFloat(width))
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.25, green: 0.95, blue: 0.65)))
#endif
    }
    
    func getBody(line1: String) -> some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingLeft), height: 12.0)
                    .background(Color(red: 0.75, green: 0.85, blue: 0.35))
#else
                Spacer()
                    .frame(width: CGFloat(paddingLeft))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                Text(line1)
                    .font(Font(font))
                    .fixedSize(horizontal: true, vertical: false)
                    //.frame(width: CGFloat(width), height: CGFloat(lineHeight))
                    .frame(height: CGFloat(lineHeight))
                    .foregroundColor(color)
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.87, green: 0.95, blue: 0.45)))
#endif
#if LABEL_HINTS
                    .overlay(Rectangle().foregroundColor(Color.white.opacity(0.5)).zIndex(3097.0))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingRight), height: 12.0)
                    .background(Color(red: 0.75, green: 0.35, blue: 0.85))
#else
                Spacer()
                    .frame(width: CGFloat(paddingRight))
#endif
                
            }
            .frame(width: CGFloat(width))
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.25, green: 0.95, blue: 0.65)))
#endif
    }
    
    func getBody() -> some View {
        VStack(spacing: 0.0) {
            
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
