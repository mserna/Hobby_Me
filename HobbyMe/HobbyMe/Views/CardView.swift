//
//  CardView.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/5/20.
//

import SwiftUI

struct CardView: View {
    let image: UIImage?
    
    init(img: UIImage) {
        self.image = img
    }
    
    var body: some View {
        Image(uiImage: self.image!)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let testImage: UIImage = UIImage(named: "1.png")!
        CardView(img: testImage)
    }
}
