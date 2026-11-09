//
//  MemoryView.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 16.01.2023.
//

import SwiftUI

struct MemoryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let day: DayModel

    var isModal: Bool = true

    var body: some View {
        if isModal {
            NavigationView {
                content
            }
        } else {
            content
        }
    }
    
    private var content: some View {
        ScrollView {
            VStack {
                HStack{
                    Text(day.title)
                        .font(.system(size: 36, weight: .semibold))
                        .padding(.leading, 20)
                        .textSelection(.enabled)
                    Spacer()
                }
                HStack{
                    Text(day.message)
                        .padding(.leading, 20)
                        .padding(.top, 5)
                        .textSelection(.enabled)
                    Spacer()
                }
                Spacer()
            }
        }
            .navigationTitle(day.date)
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                MemoryViewToolbar(
                    close: isModal ? { self.dismiss() } : nil,
                    delete: {
                        LocalRxDataManager.shared.removeMemory(
                            byId: day.id
                        )
                        self.dismiss()
                    },
                    currentMemory:
                        LocalRxDataManager.shared.getMemory(byId: self.day.id) ??
                        Memory(
                            date: Date.now,
                            title: self.day.title,
                            message: self.day.message,
                            id: self.day.id
                        )
                )
            }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(
            day:
                DayModel(
                    title: "Title",
                    message: "Just message",
                    date: "January 15",
                    id: UUID()
                )
        )
    }
}


