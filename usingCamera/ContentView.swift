//
//  ContentView.swift
//  usingCamera
//
//  Created by Michelle Elias Flores on 5/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        ZStack {
            Color(red: 1.1, green: 0.96, blue: 0.96) // Baby pink background color
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Photograph Memories")
                    .bold()
                Text("Make or View Favorite Memories!")
                Image(uiImage: selectedImage ?? UIImage(named: "camera")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                Text("Select an option below!")
                    .font(.body)
                    .foregroundColor(.pink)
                    .padding()
                HStack {
                    Button {
                        self.sourceType = .photoLibrary
                        isImagePickerShowing = true
                        // to do
                    } label: {
                        Text("Select a picture")
                            .padding()
                        .foregroundColor(.purple) }
                    Button {
                        self.sourceType = .camera
                        isImagePickerShowing = true
                        //to do
                    } label: {
                        Text("Take a picture")
                            .padding()
                        .foregroundColor(.purple) }
                }
            }
            .sheet(isPresented: $isImagePickerShowing) {
                        ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
                    }
                

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
