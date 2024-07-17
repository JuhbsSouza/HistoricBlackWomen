//
//  CarouselView.swift
//  HistoricMemoryBlackWomen
//
//  Created by Julia Silveira de Souza on 17/07/24.
//

import SwiftUI

struct CarouselView<Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable, Item.Element: Equatable {
    
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element, ID>
    
    // MARK: - Properties
    var spacing: CGFloat
    var cardPadding: CGFloat
    var items: Item
    @Binding var currentIndex: Int
    
    var extraSpace: CGFloat {
        (cardPadding / 2) - spacing
    }
    
    var onEndAction: (() -> Void)?
    
    init(currentIndex: Binding<Int>,
         spacing: CGFloat = 16,
         cardPadding: CGFloat = 80,
         items: Item,
         id: KeyPath<Item.Element, ID>,
         onEndAction: (() -> Void)? = nil,
         @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content) {
        self.content = content
        self.id = id
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.items = items
        self.onEndAction = onEndAction
        self._currentIndex = currentIndex
    }
    
    // MARK: - Gesture Properties
    @GestureState var translation: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @State var index: Int = 0
    
    // MARK: - Rotation
    @State var rotation: Double = 0
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let cardWidth = size.width - (cardPadding - spacing)
            
            LazyHStack(spacing: spacing) {
                ForEach(items, id: id) { item in
                    let index = indexOf(item: item)
                    content(
                        item,
                        CGSize(
                            width: size.width - cardPadding,
                            height: size.height)
                    )
                    .offset(y: offsetY(index: index, cardWidth: cardWidth))
                    .frame(width: size.width - cardPadding, height: size.height)
                    .contentShape(Rectangle())
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: limitScroll())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged{ onChanged(value: $0, cardWidth: cardWidth) }
                    .onEnded{ onEnd (value: $0, cardWidth: cardWidth) }
            )
        }
        .onAppear {
            offset = extraSpace
            lastStoredOffset = extraSpace
        }
        .animation(.easeInOut, value: translation == 0)
    }
    
    private func offsetY(index: Int, cardWidth: CGFloat) -> CGFloat {
        let desiredOffset: CGFloat = 30
        let progress = ((translation < 0 ? translation : -translation) / cardWidth) * desiredOffset
        let yOffset = -progress < desiredOffset ? progress : -(progress + (desiredOffset*2))
        let previous = (index - 1) == self.index ? (translation < 0 ? yOffset : -yOffset) : 0
        let next = (index + 1) == self.index ? (translation < 0 ? -yOffset : yOffset) : 0
        let inBetween = (index - 1) == self.index ? previous : next
        
        return index == self.index ? (-desiredOffset-yOffset) : inBetween
    }
    
    private func indexOf(item: Item.Element) -> Int {
        let array = Array(items)
        return array.firstIndex(of: item) ?? 0
    }
    
    private func limitScroll() -> CGFloat {
        if index == 0 && offset > extraSpace {
            return extraSpace + (offset / 4)
        } else if index == items.count - 1 && translation < 0 {
            return offset - (translation / 2)
        } else {
            return offset
        }
    }
    
    private func onChanged(value: DragGesture.Value, cardWidth: CGFloat) {
        let translation = value.translation.width
        offset = translation + lastStoredOffset
        
        let progress = offset / cardWidth
        rotation = progress * 5
    }
    
    private func updateCurrentIndex(cardWidth: CGFloat) {
        currentIndex = Int(findCurrentIndex(cardWidth: cardWidth))
    }
    
    private func onEnd(value: DragGesture.Value, cardWidth: CGFloat) {
        updateCurrentIndex(cardWidth: cardWidth)
        index = -currentIndex
        withAnimation(.easeInOut(duration: 0.1)) {
            // MARK: Removing Extra Space
            // Why /2 -> Because We Need Both Sides Need to Be Visible
            offset = (cardWidth * findCurrentIndex(cardWidth: cardWidth)) + extraSpace
            
            let progress = offset / cardWidth
            rotation = (progress * 2).rounded() - 1
        }
        lastStoredOffset = offset
        onEndAction?()
    }
    
    private func findCurrentIndex(cardWidth: CGFloat) -> CGFloat {
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        return _index
    }
}
