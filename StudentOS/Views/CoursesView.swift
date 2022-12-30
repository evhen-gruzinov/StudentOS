//
//  Created by Evhen Gruzinov on 23.11.2022.
//

import SwiftUI

struct CoursesView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    #if os(macOS)
    var lightBG = CGColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
    #else
    var lightBG = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    #endif
    var backgroundColor: CGColor {
        if colorScheme == .dark { return CGColor(red: 0, green: 0, blue: 0, alpha: 1) }
        else { return lightBG }
    }
    var courses: [Course]
    let columns = [
        GridItem(.adaptive(minimum: 350))
    ]
    
    var body: some View {
            ZStack {
                Color(backgroundColor)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(courses, id: \.id) { course in
                            CourseInfoBlockView(course: course)
                        }
                    }
                    .padding()
                }.padding(.top)
            .navigationTitle("Courses")
            #if !os(macOS)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.mode.wrappedValue.dismiss()
            }){
                Image(systemName: "list.bullet")
            })
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView(courses: TestData().courses)
    }
}
