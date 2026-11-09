//
//  DayList.swift
//  Just Diary
//
//  Created by Alexander Manzurov on 05.01.2023.
//

import SwiftUI

struct DayList: View {
    @State public var title: String
    
    @State var showSheetView: Bool = false
    
    // Columns report a compact size class on iPad, so the parent decides
    private let opensMemoryInColumn: Bool
    @State private var selectedDayId: UUID?
    @State var clickIdString: String?
    
    @ObservedObject public var viewModel: ViewModel
    
    init(month: String, year: String, opensMemoryInColumn: Bool = false) {
        self.title = "\(month) \(year)"
        self.opensMemoryInColumn = opensMemoryInColumn
        _viewModel = ObservedObject(
            wrappedValue: ViewModel(
                month: month,
                year: year
            ))
    }

    var body: some View {
        List(viewModel.daysList) { day in
            dayButton(day)
            .swipeActions {
                Button(action: {
                    LocalRxDataManager.shared.removeMemory(
                        byId: day.id
                    )
                }) {
                    Image(systemName: "trash").imageScale(.large)
                }
                .tint(.red)
                
                Button(action: {
                    LocalRxDataManager.shared.setMemoryFavorite(byId: day.id)
                }) {
                    Image(systemName: "star.fill").imageScale(.large)
                }
                .tint(.blue)
            }
            
        }
        .sheet(isPresented: $showSheetView) {
            let day = UseCases.shared.findTriggeredObj(
                byId: viewModel.clickDayIdString,
                in: viewModel.daysList
            )
            MemoryView(day: day)
        }
        .navigationTitle(title)
    }
    
    // On iPad the memory opens in the detail column, on iPhone in a sheet
    @ViewBuilder
    private func dayButton(_ day: DayModel) -> some View {
        if opensMemoryInColumn {
            NavigationLink(tag: day.id, selection: $selectedDayId) {
                MemoryView(day: day, isModal: false)
            } label: {
                DayRow(day: day)
            }
            // Replaces the system accent highlight, DayRow colors don't adapt to it
            .listRowBackground(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(selectedDayId == day.id ? Color.primary.opacity(0.1) : Color.clear)
            )
        } else {
            Button(action: {
                self.showSheetView.toggle()
                viewModel.clickDayIdString = day.id.uuidString
            }) {
                DayRow(day: day)
            }
        }
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DayList(
                month: "January",
                year: "2023"
            )
        }
    }
}

