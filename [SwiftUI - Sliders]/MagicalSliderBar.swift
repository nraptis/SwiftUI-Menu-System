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
        
        let thumbCircleSize = SliderLayout.getThumbCircleSize(orientation: orientation)
        let thumbHitBoxWidth = SliderLayout.getThumbHitBoxWidth(orientation: orientation)
        
        let sizeDifferential = thumbHitBoxWidth - thumbCircleSize
        let sizeDifferential2 = sizeDifferential >> 1
        
        let barWidth = (sliderBoxWidth - thumbCircleSize)
        
        let thumbOffsetX = magicalSliderViewModel.thumbOffsetX + dragGestureState.x
        
        let barWidthLHS = Int(thumbOffsetX + 0.5)
        let barWidthRHS = barWidth - barWidthLHS
        
        var sliderBoxWidthMinusBoxWidth = sliderBoxWidth - thumbHitBoxWidth
        if sliderBoxWidthMinusBoxWidth < 0 {
            sliderBoxWidthMinusBoxWidth = 0
        }
        
        return ZStack {
            
            if barWidth > 0 {
                HStack(spacing: 0.0) {
                    if barWidthLHS > 0 {
                        HStack(spacing: 0.0) {
                            
                        }
                        .frame(width: CGFloat(barWidthLHS), height: 12.0)
                        .background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color.yellow.opacity(0.75)))
                    }
                    if barWidthRHS > 0 {
                        HStack(spacing: 0.0) {
                            
                        }
                        .frame(width: CGFloat(barWidthRHS), height: 12.0)
                        .background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color.gray.opacity(0.75)))
                    }
                    
                }
                .frame(width: CGFloat(barWidth), height: 12.0)
                //.background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color.red.opacity(0.75)))
            }
            
            HStack(spacing: 0.0) {
                
                ZStack {
                    ZStack {
                        Circle()
                            .frame(width: CGFloat(thumbCircleSize), height: CGFloat(thumbCircleSize))
                            .foregroundStyle(Color.white)
                        Circle()
                            .frame(width: CGFloat(thumbCircleSize - 3), height: CGFloat(thumbCircleSize - 3))
                            .foregroundStyle(Color.gray)
                    }
                    .frame(width: CGFloat(thumbCircleSize),
                           height: CGFloat(thumbCircleSize))
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
#if INTERFACE_HINTS
            .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.65, green: 0.87, blue: 1.0, opacity: 0.65)))
#endif
            
        }
    }
    
    private func dragUpdating(dragValue: DragGesture.Value, dragGestureState: inout DragState, transaction: inout Transaction) {
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
        
        var position = magicalSliderViewModel.thumbOffsetX + dragValue.translation.width
        if position < magicalSliderViewModel.thumbMinimumX {
            position = magicalSliderViewModel.thumbMinimumX
        }
        if position > magicalSliderViewModel.thumbMaximumX {
            position = magicalSliderViewModel.thumbMaximumX
        }
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = position / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if isDragging == false {
            isDragging = true
            magicalSliderViewModel.handleSlideStarted(percent: magicalSliderViewModel.percent)
        }
        magicalSliderViewModel.handleSlideUpdated(percent: percent)
    }
    
    private func dragEnded(dragValue: DragGesture.Value) {
        isDragging = false
        
        var thumbOffsetX = magicalSliderViewModel.thumbOffsetX
        thumbOffsetX += dragValue.translation.width
        
        if thumbOffsetX < magicalSliderViewModel.thumbMinimumX {
            thumbOffsetX = magicalSliderViewModel.thumbMinimumX
        }
        if thumbOffsetX > magicalSliderViewModel.thumbMaximumX {
            thumbOffsetX = magicalSliderViewModel.thumbMaximumX
        }
        
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = thumbOffsetX / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        magicalSliderViewModel.handleSlideFinished(percent: percent)
        magicalSliderViewModel.thumbOffsetX = thumbOffsetX
    }
}
