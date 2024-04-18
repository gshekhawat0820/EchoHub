//
//  FavoriteView.swift
//  EchoHub
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct FavoriteView: View {
    @Binding var isAdmin: Bool;
    var assistantName: String;
    
    @Query(sort: \Action.favoriteOrder) var actions: [Action];

    @State private var dragging: Action?;

    init(assistantName: String, isAdmin: Binding<Bool>) {
        self._isAdmin = isAdmin;
        self.assistantName = assistantName;

        let admin = isAdmin.wrappedValue;
        self._actions = Query(
            filter: #Predicate { $0.favorite && $0.device == assistantName && (!$0.hidden || admin) },
            sort: \.favoriteOrder
        );
    }

    var body: some View {
        HStack {
            Text("Favorites ⭐")
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
                            favorite: true
                        )
                    )
            }
        })
        .animation(.default, value: self.actions)
        .padding(15)
    }
}
