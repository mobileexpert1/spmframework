//
//  File.swift
//  
//
//  Created by Jared Davidson on 9/7/21.
//

import Foundation
import SwiftUI
import DocumentReader
//import FaceLiveness

@available(iOS 13.0, *)
public struct SwiftUIView: View {
	public init() {
        

        DocReader.shared.processParams.multipageProcessing = 0
        
        
    }
	public var body: some View {
		Text("THIS IS THE SWIFTUIVIEW FROM THE PACKAGE")
		Image(uiImage: UIImage(named: "starscream", in: .module, with: nil)!)
			.resizable()
			.frame(width: 100, height: 100, alignment: .center)
			.aspectRatio(contentMode: .fit)
	}
}
