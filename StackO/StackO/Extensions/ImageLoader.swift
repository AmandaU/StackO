//
//  ImageLoader.swift
//  StackO
//
//  Created by Amanda Baret on 2021/04/10.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        print(url)
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var localimage: UIImage = UIImage()
    @Binding var width: CGFloat
    @Binding var height: CGFloat
    let url: String

    init(withURL url:String, width: Binding<CGFloat>, height: Binding<CGFloat>) {
        self.url = url
        self.imageLoader = ImageLoader(urlString:url)
        self._width = width
        self._height = height
    }

    var body: some View {
        ZStack {
            Image(uiImage: self.localimage ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:  self.width, height:self.height)
                .cornerRadius(7)

        }.onReceive(imageLoader.didChange) { data in
            if !self.url.isEmpty {
                self.localimage = UIImage(data: data) ?? UIImage()
            }
        }
    }
}


