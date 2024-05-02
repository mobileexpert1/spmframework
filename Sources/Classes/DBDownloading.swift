//
//  DBDownloading.swift
//  IpassFrameWork1
//
//  Created by Mobile on 10/04/24.
//

import Foundation
import DocumentReader
import Amplify
import AWSCognitoAuthPlugin
//import Amplify
public class DataBaseDownloading{
    
    public static func initialization(completion: @escaping (String, String, String) -> Void) {
        
        do {
            Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            
           // try Amplify.configure()
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        
        // Custom path to your configuration file
       
        
        
        
        let configPath = Bundle.module.url(forResource: "awsconfiguration", withExtension: "json")
        
        let customConfigPath = configPath?.absoluteString ?? ""

        // Load configuration from the custom path
        if let amplifyConfig = loadAmplifyConfiguration(from: customConfigPath) {
            // Configure Amplify with the loaded configuration
            do {
                try Amplify.configure(amplifyConfig)
            }
            catch {
                print("Failed to configure Amplify with custom configuration.")
            }
        } else {
            // Handle error loading or decoding configuration
            print("Failed to configure Amplify with custom configuration.")
        }
        
        
        DocumentReaderService.shared.initializeDatabaseAndAPI(progress: { state in
            var progressValue = ""
            var status = ""
            var validationError = ""
            switch state {
            case .downloadingDatabase(progress: let progress):
                let progressString = String(format: "%.1f", progress * 100)
                progressValue = "Downloading database: \(progressString)%"
            case .initializingAPI:
                status = "Start Now"
            case .completed:
                break
            case .error(let text):
                validationError = text
                print(text)
            }
            completion(progressValue, status, validationError)
        })
    }
    
    
    public static  func loadAmplifyConfiguration(from path: String) -> AmplifyConfiguration? {
        // Read configuration data from the custom path
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            print("Failed to read configuration data from path: \(path)")
            return nil
        }

        // Decode the configuration data into an AmplifyConfiguration object
        do {
            let configuration = try JSONDecoder().decode(AmplifyConfiguration.self, from: data)
            return configuration
        } catch {
            print("Failed to decode configuration data: \(error)")
            return nil
        }
    }


    
    
}
