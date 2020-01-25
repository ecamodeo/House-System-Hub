//
//  Database.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/24/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import Firebase
import Combine

class ReportLookup: ObservableObject {
    
    @Published var reports = [Report]()
    
    let db = Firestore.firestore()
    
    init() {
        
        var tempReports = [Report]()
        
        let reportRef = db.collection("mentorReports")
        
        reportRef.addSnapshotListener { documentSnapshot, error in
            guard let reports = documentSnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
              }
            
            self.reports.removeAll()
            tempReports.removeAll()
            
            for report in reports {
                if let cprType = report["cpr_type"] as? String,
                let timestamp = report["date"] as? Timestamp,
                let email = report["email"] as? String,
                let house = report["house"] as? String,
                let mentorGroup = report["mentor_group"] as? String,
                let mentorName = report["mentor_name"] as? String,
                let pointEarningActivity = report["point_earning_activity"] as? String,
                let quantity = report["quantity"] as? Int,
                let reportData = report["reportData"] as? String,
                let reportType = report["report_type"] as? String,
                let studentName = report["student_name"] as? String,
                let totalPoints = report["total_points"] as? Int,
                let username = report["username"] as? String,
                let headApproved = report["head_approved"] as? Bool,
                let documentID = report["document_ID"] as? String {
                let date = timestamp.dateValue()
                        let repo = Report(id: documentID, cprType: cprType, email: email, house: house, mentorGroup: mentorGroup, mentorName: mentorName, pointEarningActivity: pointEarningActivity, date: date, quantity: quantity, reportData: reportData, reportType: reportType, studentName: studentName, totalPoints: totalPoints, username: username, headApproved: headApproved)
                        tempReports.append(repo)
                }
                _ = tempReports.sort {
                    return $0.date > $1.date
                }
                self.reports = tempReports
            }
        }
    }
}
