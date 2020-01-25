//
//  ReportView.swift
//  House System Hub
//
//  Created by Eric Amodeo on 1/14/20.
//  Copyright © 2020 The Pasta Peddler, Inc. All rights reserved.
//

import SwiftUI

struct ReportView: View {
    
    @State var date = Date()
    @State var reportType = 0
    
    var body: some View {

        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            Image("150th")
                                .resizable()
                                .frame(width: 200, height: 140, alignment: .center)
                            Text("\"Go forth and set the world on fire.\"").italic().font(.subheadline)
                        }
                        Spacer()
                    }
                }
                Section {
                    HStack {
                        Text("Mentor Name").font(.headline).foregroundColor(.gray)
                        Spacer()
                        Text("Eric Amodeo").foregroundColor(.gray)
                    }
                    HStack {
                        Text("House").font(.headline)
                        Spacer()
                        Text("Loyola")
                    }
                    HStack {
                        Text("Mentor Group").font(.headline).foregroundColor(.gray)
                        Spacer()
                        Text("L1").foregroundColor(.gray)
                    }
                    HStack {
                        DatePicker(selection: $date, displayedComponents: .date) {
                            Text("Date")
                            }.font(.headline).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Report Type").font(.headline)
                        Picker(selection: $reportType, label: Text("Report Type")) {
                            Text("Weekly").tag(0)
                            Text("Points").tag(1)
                            Text("Cura Personalis").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("Information")) {
                    Group {
                        if reportType == 0 {
                            weeklyView()
                        } else if reportType == 1 {
                            pointsView()
                        } else {
                            curaView()
                        }
                    }
                }
                
                Section {
                    HStack {
                        Spacer()

                        Button(action: {
                            print("form cleared")
                        }, label: {
                            Text("Clear").foregroundColor(.white).font(.headline)
                        })
                        .padding()
                        .frame(width: 180, height: 40)
                        .background(Color.red)
                        .cornerRadius(5)

                        Spacer()
                    }
                    
                }
                
                Section {
                    HStack {
                        Spacer()

                        Button(action: {
                            print("form submitted")
                        }, label: {
                            Text("Submit").foregroundColor(.white).font(.headline)
                        })
                        .padding()
                        .frame(width: 180, height: 40)
                        .background(Color.green)
                        .cornerRadius(5)
                        Spacer()
                    }
                    
                }
            }
        .navigationBarTitle(Text("Reports"))
        
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}

struct weeklyView: View {
    
    @State var weeklyDetails = ""
    @State var showExample = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Details").font(.headline)
                Spacer()
                Text("Show Example").font(.footnote)
                Toggle("Show Example", isOn: $showExample).labelsHidden()
                
            }
            if showExample {
                Text("A4 had a good week for the most part. We had 16 guys attend the volleyball game on Saturday, which is a big jump from the last time we had a game. We have almost all of our slots for the upcoming House Games filled—we just need a couple of swimmers. I have found submitting the Cura Personalis reports works pretty well, and I have already managed to submit a couple. Jack Smith has volunteered to offer a brief presentation about his music production hobby at our next House Meeting. The guys would like to know if it would be possible to have House paintball. As for academics, we have a few freshmen and sophomores who are particularly struggling. I have tried to help set them up with upperclassmen who can help. I could use some help coming up with some ideas for community building, especially among my younger guys. I am planning to have donuts on Friday whenever possible; we are collecting donations in order to do this.").font(.body).foregroundColor(.gray)
            }
            TextField("Type your report here.", text: $weeklyDetails)
        }
    }
}

struct pointsView: View {
    
    var pointActivity = [
        PointReportType(id: 0, name: "Attended Sporting Event or Extracurricular", value: 1),
        PointReportType(id: 1, name: "Attended a Retreat", value: 5),
        PointReportType(id: 2, name: "Served as Retreat Leader", value: 8),
        PointReportType(id: 3, name: "Attended an Immersion Trip", value: 10),
        PointReportType(id: 4, name: "Member of a Tier 1 Club", value: 10),
        PointReportType(id: 5, name: "Member of a Tier 2 Club", value: 5),
        PointReportType(id: 6, name: "Member of a Team", value: 15),
        PointReportType(id: 7, name: "Achieved Second Honors", value: 20),
        PointReportType(id: 8, name: "Achieved First Honors", value: 25),
        PointReportType(id: 9, name: "Received JUG", value: -1),
        PointReportType(id: 9, name: "Miscellaneous", value: 1)
    ]
    @State var numberOfStudents = "0"
    @State var chosenActivity = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Point Activity").font(.headline)
                Spacer()
                Picker(selection: $chosenActivity, label: Text("Type")) {
                    ForEach(pointActivity) { activity in
                        Text(activity.name)
                    }
                    }.labelsHidden().fixedSize()
            }
            Divider()
            HStack {
                Text("Number of Students").font(.headline)
                Spacer()
                TextField("", text: $numberOfStudents).fixedSize()
            }
            Divider()
            HStack {
                Text("Total Points").font(.headline)
                Spacer()
                Text("12").foregroundColor(.gray)
            }
            
        }
    }
}

struct curaView: View {
    
    @State var curaDetails = ""
    @State var studentName = ""
    @State var curaType = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Details").font(.headline)
            TextField("Type your report here.", text: $curaDetails)
            Divider()
            HStack {
                Text("Type").font(.headline)
                Spacer()
                Picker(selection: $curaType, label: Text("Type")) {
                    Text("Accolade").tag(0)
                    Text("Academic Concern").tag(1)
                    Text("Personal Concern").tag(2)
                    Text("Classroom Behavior").tag(3)
                }.labelsHidden().fixedSize().pickerStyle(SegmentedPickerStyle())
            }
            Divider()
            HStack {
                Text("Student Name").font(.headline)
                Spacer()
                TextField("Student Name", text: $studentName).fixedSize()
            }
        }
    }
}
