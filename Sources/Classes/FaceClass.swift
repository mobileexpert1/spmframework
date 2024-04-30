//
//  SwiftUIView.swift
//  
//
//  Created by Vishal on 30/04/24.
//

//import SwiftUI
//
//struct FaceClass: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    SwiftUIView()
//}

import SwiftUI
import FaceLiveness
import DocumentReader
import UIKit


struct FaceClass: View {
    @State private var isPresentingLiveness = true
    @State private var isPresentingUserInfo = false
    
    // Change this to a @State property
    @State private var faceLivenessStringValue = ""
    var sessoinIdValue = ""
    var results: DocumentReaderResults!
    var isScanningTypeIndex:Int?

    var body: some View {
        FaceLivenessDetectorView(
            sessionID: sessoinIdValue,
            region: "us-east-1",
            disableStartView: true,
            isPresented: $isPresentingLiveness,
            onCompletion: { result in
                switch result {
                case .success:
                    print("Success")
                    DispatchQueue.main.async {
                        self.faceLivenessStringValue = "1" // Now you can modify this
                        UserDefaults.standard.set(faceLivenessStringValue, forKey: "faceLiveness")
                        self.isPresentingUserInfo = true
                    }
                case .failure(_):
                    print("Failure")
                    DispatchQueue.main.async {
                        self.faceLivenessStringValue = "0" // Now you can modify this
                        UserDefaults.standard.set(faceLivenessStringValue, forKey: "isFaceLiveness")
                        self.isPresentingUserInfo = true
                    }
                default:
                    print("Default case")
                }
            
            }
        )
        .sheet(isPresented: $isPresentingUserInfo) {

        }
    }
}
