//
//  Models.swift
//  House System Hub
//
//  Created by Eric Amodeo on 12/18/19.
//  Copyright © 2019 The Pasta Peddler, Inc. All rights reserved.
//

import Foundation

class User2 {
    @Published var uid: String
    @Published var username: String?
    @Published var email: String?
    @Published var fullName: String?
    @Published var firstName: String?
    @Published var lastName: String?
    @Published var role: String?
    @Published var house: String?
    @Published var mentorGroup: String?
    
    init(uid: String, username: String?, fullName: String?, email: String?, firstName: String?, lastName: String?, role: String?, house: String?, mentorGroup: String?) {
        self.uid = uid
        self.username = username
        self.email = email
        self.fullName = fullName
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
        self.house = house
        self.mentorGroup = mentorGroup
    }
}

class User {
    
    @Published var uid: String
    @Published var email: String?
    @Published var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}

struct PointReportType: Identifiable, Hashable {
    let id: Int
    let name: String
    let value: Int
}

struct Report: Codable, Equatable, Identifiable {
    var id: String
    var cprType, email, house, mentorGroup, mentorName, pointEarningActivity: String
    var date: Date
    var quantity: Int
    var reportData: String
    var reportType: String
    var studentName: String
    var totalPoints: Int
    var username: String
    var headApproved: Bool
}
