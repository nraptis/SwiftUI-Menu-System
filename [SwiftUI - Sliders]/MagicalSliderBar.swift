//
//  MagicalSliderBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import SwiftUI

struct MagicalSliderBar: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalSliderViewModel: MagicalSliderViewModel
    
    enum DragState {
        case idle
        case dragging(x: CGFloat)
        var x: CGFloat {
            switch self {
            case .idle:
                return 0.0
            case .dragging(let x):
                return x
            }
        }
    }
    
    @GestureState var dragGestureState = DragState.idle
    @State var isDragging = false
    
    var body: some View {
        
        let orientation = magicalSliderViewModel.orientation
        
        let sliderBoxWidth = magicalSliderViewModel.sliderBoxWidth
        
        let thumbWidth = SliderLayout.getThumbWidth(orientation: orientation)
        let thumbHeight = SliderLayout.getThumbHeight(orientation: orientation)
        
        let thumbHitBoxWidth = SliderLayout.getThumbHitBoxWidth(orientation: orientation)
        
        let textIcon = magicalSliderViewModel.sliderConfiguration.getTextIcon(orientation: orientation,
                                                                              layoutSchemeFlavor: .long)
        
        /*
        var iconWidth = 0
        var iconHeight = 0
        if Device.isPad {
            iconWidth = 44
            iconHeight = 36
        } else {
            if orientation.isLandscape {
                iconWidth = 24
                iconHeight = 24
            } else {
                iconWidth = 28
                iconHeight = 28
            }
        }
        */
        
        let imageWidth = textIcon.imageWidth
        let imageHeight = textIcon.imageHeight
        let iconX = textIcon.iconX
        let iconY = textIcon.iconY
        let iconWidth = textIcon.iconWidth
        let iconHeight = textIcon.iconHeight
        
        
        
        //let thumbInset = SliderLayout.getThumbInset(orientation: orientation)
        
        let bumperWidth = SliderLayout.getBumperWidth(orientation: orientation)
        let bumperHeight = SliderLayout.getBumperHeight(orientation: orientation)
        
        let bumperCornerRadius = SliderLayout.getBumperCornerRadius(orientation: orientation)
        
        let thumbCornerRadiusOuter = SliderLayout.getThumbCornerRadiusOuter(orientation: orientation)
        let thumbCornerRadiusInner = SliderLayout.getThumbCornerRadiusInner(orientation: orientation)
        let thumbLineThickness = SliderLayout.getThumbLineThickness(orientation: orientation)
        
        
        
        
        let sizeDifferential = thumbHitBoxWidth - thumbWidth
        let sizeDifferential2 = sizeDifferential >> 1
        
        let barWidth = (sliderBoxWidth - (bumperWidth + bumperWidth))
        let barHeight = SliderLayout.getBarHeight(orientation: orientation)
        
        let thumbOffsetX = magicalSliderViewModel.thumbOffsetX + dragGestureState.x
        
        let barWidthLHS = Int(thumbOffsetX + 0.5 - magicalSliderViewModel.thumbMinimumX) + (thumbWidth >> 1)
        let barWidthRHS = barWidth - barWidthLHS
        
        var sliderBoxWidthMinusBoxWidth = sliderBoxWidth - thumbHitBoxWidth
        if sliderBoxWidthMinusBoxWidth < 0 {
            sliderBoxWidthMinusBoxWidth = 0
        }
        
        let color = magicalSliderViewModel.getTextAndIconColor()
        
        return ZStack {
            
            if barWidth > 0 {
                HStack(spacing: 0.0) {
                    
                    if barWidthLHS > 0 {
                        HStack(spacing: 0.0) {
                            ToolInterfaceTheme.blueBasic
                        }
                        .frame(width: CGFloat(barWidthLHS), height: CGFloat(barHeight))
#if INTERFACE_HINTS
                        .background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color.yellow.opacity(0.75)))
#endif
                    }
                    if barWidthRHS > 0 {
                        HStack(spacing: 0.0) {
                            
                        }
                        .frame(width: CGFloat(barWidthRHS), height: CGFloat(barHeight))
#if INTERFACE_HINTS
                        .background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color.gray.opacity(0.75)))
#endif
                    }
                    
                }
                .frame(width: CGFloat(sliderBoxWidth), height: CGFloat(barHeight))
                .background(ToolInterfaceTheme.gray400)
#if INTERFACE_HINTS
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke().foregroundStyle(Color.blue.opacity(0.75)))
#endif
            }
            
            if barWidth > 0 {
                HStack(spacing: 0.0) {
                    
                    VStack {
                        
                    }
                    .frame(width: CGFloat(bumperWidth), height: CGFloat(bumperHeight))
                    .background(RoundedRectangle(cornerRadius: CGFloat(bumperCornerRadius))
                        .foregroundStyle(ToolInterfaceTheme.gray150))
                    
                    Spacer(minLength: 0.0)
                    
                    VStack {
                        
                    }
                    .frame(width: CGFloat(bumperWidth), height: CGFloat(bumperHeight))
                    .background(RoundedRectangle(cornerRadius: CGFloat(bumperCornerRadius))
                        .foregroundStyle(ToolInterfaceTheme.gray150))
                    
                }
                .frame(width: CGFloat(sliderBoxWidth), height: 12.0)
            }
            
            
            HStack(spacing: 0.0) {
                
                ZStack {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: CGFloat(thumbCornerRadiusOuter))
                            .frame(width: CGFloat(thumbWidth), height: CGFloat(thumbHeight))
                            .foregroundStyle(ToolInterfaceTheme.gray700)
                        RoundedRectangle(cornerRadius: CGFloat(thumbCornerRadiusInner))
                            .frame(width: CGFloat(thumbWidth - (thumbLineThickness + thumbLineThickness)),
                                   height: CGFloat(thumbHeight - (thumbLineThickness + thumbLineThickness)))
                            .foregroundStyle(ToolInterfaceTheme.gray050)
                        IconBox(icon: textIcon,
                                imageWidth: imageWidth,
                                imageHeight: imageHeight,
                                iconX: iconX,
                                iconY: iconY,
                                iconWidth: iconWidth,
                                iconHeight: iconHeight,
                                iconPaddingLeft: 0,
                                iconPaddingRight: 0,
                                iconPaddingTop: 0,
                                color: color)
                    }
                    .frame(width: CGFloat(thumbWidth),
                           height: CGFloat(thumbHeight))
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.35, opacity: 0.65)))
#endif
                }
                .frame(width: CGFloat(thumbHitBoxWidth), 
                       height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
                .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.45, opacity: 0.65)))
#endif
                .offset(x: CGFloat(-sizeDifferential2), y: 0.0)
                .offset(CGSize(width: magicalSliderViewModel.thumbOffsetX + dragGestureState.x, height: 0.0))
                .gesture(
                    DragGesture(minimumDistance: 2.0, coordinateSpace: .local)
                        .updating($dragGestureState, body: dragUpdating)
                        .onChanged(dragChanged(dragValue:))
                        .onEnded(dragEnded(dragValue:)))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(sliderBoxWidthMinusBoxWidth), height: 20.0)
                    //.background(Color(red: 0.75, green: 1.0, blue: 1.0, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(sliderBoxWidthMinusBoxWidth))
#endif
            }
            .frame(width: CGFloat(sliderBoxWidth),
                   height: CGFloat(magicalSliderViewModel.layoutHeight))
            
        }
        .frame(width: CGFloat(sliderBoxWidth),
               height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
        .background(Rectangle().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.65, opacity: 0.15)))
#endif
        
    }
    
    private func dragUpdating(dragValue: DragGesture.Value, dragGestureState: inout DragState, transaction: inout Transaction) {
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var translation = dragValue.translation.width
        
        let proposedX = magicalSliderViewModel.thumbOffsetX + dragValue.translation.width
        if proposedX > magicalSliderViewModel.thumbMaximumX {
            translation = (magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbOffsetX)
        }
        if proposedX < magicalSliderViewModel.thumbMinimumX {
            translation = magicalSliderViewModel.thumbMinimumX - magicalSliderViewModel.thumbOffsetX
        }
        dragGestureState = .dragging(x: translation)
    }
    
    private func dragChanged(dragValue: DragGesture.Value) {
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var position = magicalSliderViewModel.thumbOffsetX + dragValue.translation.width
        
        if position > magicalSliderViewModel.thumbMaximumX {
            position = magicalSliderViewModel.thumbMaximumX
        }
        if position < magicalSliderViewModel.thumbMinimumX {
            position = magicalSliderViewModel.thumbMinimumX
        }
        
        
        print("position = \(position), minX = \(magicalSliderViewModel.thumbMinimumX)")
        
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (position - magicalSliderViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (position >= magicalSliderViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (position <= magicalSliderViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        
        if isDragging == false {
            isDragging = true
            magicalSliderViewModel.handleSlideStarted(percent: magicalSliderViewModel.percent)
        }
        magicalSliderViewModel.handleSlideUpdated(percent: percent)
    }
    
    private func dragEnded(dragValue: DragGesture.Value) {
        isDragging = false
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var thumbOffsetX = magicalSliderViewModel.thumbOffsetX
        thumbOffsetX += dragValue.translation.width
        
        print("thumbOffsetX = \(thumbOffsetX), minX = \(magicalSliderViewModel.thumbMinimumX)")
        
        if thumbOffsetX > magicalSliderViewModel.thumbMaximumX {
            thumbOffsetX = magicalSliderViewModel.thumbMaximumX
        }
        if thumbOffsetX < magicalSliderViewModel.thumbMinimumX {
            thumbOffsetX = magicalSliderViewModel.thumbMinimumX
        }
        
        
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (thumbOffsetX - magicalSliderViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (thumbOffsetX >= magicalSliderViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (thumbOffsetX <= magicalSliderViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        magicalSliderViewModel.handleSlideFinished(percent: percent)
        magicalSliderViewModel.thumbOffsetX = thumbOffsetX
    }
}
