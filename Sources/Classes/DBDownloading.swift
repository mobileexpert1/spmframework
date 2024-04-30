//  DBDownloading.swift
//  IpassFrameWork1
//  Created by Mobile on 10/04/24.

import Foundation
import DocumentReader
import Amplify
import AWSCognitoAuthPlugin

public class DataBaseDownloading{
    
    public static func initialization(completion: @escaping (Bool, Double, Bool, String) -> Void) {
        var amplifyStatus = false
        do {
            Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            amplifyStatus = true
        } catch {
            amplifyStatus = false
            print("An error occurred setting up Amplify: \(error)")
        }
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = Double()
            var status = false
            var validationError = ""
            switch state {
            case .downloadingDatabase(progress: let progress):
//                let progressString = String(format: "%.1f", progress * 100)
//                progressValue = "Downloading database: \(progressString)%"
                progressValue = progress
                if progressValue == 100.0 {
                    status = true
                }
            case .initializingAPI:
                status = true
            case .completed:
                break
            case .error(let text):
                status = false
                validationError = text
                print(text)
            }
            completion(amplifyStatus, progressValue, status, validationError)
        })
    }
    
    
}
