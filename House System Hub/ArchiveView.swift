//
//  ArchiveView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/15/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI

struct ArchiveView: View {
    
    @ObservedObject var obsReports = ReportLookup()
    @State var isPresented = false
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchTerm)
                List {
                    ForEach (obsReports.reports.filter {
                        self.searchTerm.isEmpty ? true : $0.reportType.localizedCaseInsensitiveContains(self.searchTerm)
                    }) { report in
                        ReportRow(report: report)
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView()
    }
}

struct ReportRow: View {
    let report: Report
    
    var body: some View {
        VStack {
            HStack {
                Text(report.reportType).font(.headline)
                Text(" (\(report.mentorGroup))").font(.subheadline)
                Spacer()
            }
            Text("Submitted by \(report.mentorName) on \(report.date)")
        }
    }
}
