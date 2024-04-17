//
//  CategoryView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct CategoryView: View {
    let assistantName: String;
    
    var title: String;
    var actions: [Action];
    @Binding var isAdmin: Bool;
    
    @State private var dragging: Action?;

    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
        LazyVGrid(columns: gridLayout, spacing: 15, content: {
            ForEach(self.actions.filter({!$0.hidden || isAdmin })) { action in
                ActionIconView(isAdmin: $isAdmin, assistantName: self.assistantName, action: action)
                    .overlay(dragging?.name == action.name ? Color.white.opacity(0.8) : Color.clear)
                    .onDrag {
                        self.dragging = action;
                        return NSItemProvider(object: action.name as NSString)
                    }
                    .onDrop(
                        of: [UTType.text],
                        delegate: DragRelocateDelegate(
                            action: action,
                            listData: self.actions.filter({!$0.hidden || isAdmin }),
                            current: $dragging
                        )
                    )
            }
        })
        .animation(.default, value: self.actions.filter({!$0.hidden || isAdmin }))
        .padding(15)
    }
}

struct DragRelocateDelegate: DropDelegate {
    let action: Action;
    var listData: [Action];
    @Binding var current: Action?;

    func dropEntered(info: DropInfo) {
        if (current == nil) {
            return;
        }

        if action != current {
            let from = listData.firstIndex(of: current!)!
            let to = listData.firstIndex(of: action)!
            if listData[to].name != current!.name {
                current!.order = to;
                listData[to].order = from;
            }
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move);
    }

    func performDrop(info: DropInfo) -> Bool {
        self.current = nil;
        return true
    }
}

#Preview {
    CategoryView(assistantName: "Amazon Alexa", title: "Household", actions: [], isAdmin: .constant(false))
        .previewLayout(.sizeThatFits)
        
}
