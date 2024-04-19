import SwiftUI

struct DragRelocateDelegate: DropDelegate {
    let action: Action;
    var listData: [Action];
    @Binding var current: Action?;
    let favorite: Bool;

    func dropEntered(info: DropInfo) {
        if (self.current == nil) {
            return;
        }

        if action != self.current {
            let from = listData.firstIndex(of: self.current!)!
            let to = listData.firstIndex(of: action)!
            if listData[to].name != self.current!.name {
                if (self.favorite) {
                    self.current!.favoriteOrder = to;
                    listData[to].favoriteOrder = from;
                } else {
                    self.current!.order = to;
                    listData[to].order = from;
                }
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
