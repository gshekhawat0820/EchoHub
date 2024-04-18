//
//  CategoryView.swift
//  EchoHub
//
//  Created by Gaurav Shekhawat on 2/8/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct CategoryView: View {
    @Binding var isAdmin: Bool;
    var assistantName: String;

    var category: String;
    var emoji: String;
    
    @Query(sort: \Action.order) var actions: [Action];
    
    @State private var dragging: Action?;

    init(assistantName: String, category: String, emoji: String, isAdmin: Binding<Bool>) {
        self._isAdmin = isAdmin;
        self.assistantName = assistantName;

        self.category = category;
        self.emoji = emoji;

        let admin = isAdmin.wrappedValue;
        self._actions = Query(
            filter: #Predicate { $0.category == category && $0.device == assistantName && (!$0.hidden || admin) },
            sort: \.order
        );
    }

    var body: some View {
        HStack {
            Text("\(category) \(emoji)")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
        LazyVGrid(columns: gridLayout, spacing: 15, content: {
            ForEach(self.actions) { action in
                ActionIconView(isAdmin: $isAdmin, assistantName: self.assistantName, action: action)
                    .onDrag {
                        self.dragging = action;
                        return NSItemProvider(object: action.name as NSString)
                    }
                    .onDrop(
                        of: [UTType.text],
                        delegate: DragRelocateDelegate(
                            action: action,
                            listData: self.actions,
                            current: $dragging,
                            favorite: false
                        )
                    )
            }
        })
        .animation(.default, value: self.actions)
        .padding(15)
    }
}
