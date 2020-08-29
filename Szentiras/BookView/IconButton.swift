//
//  IconButton.swift
//  Szentiras
//
//  Created by Gabor Sornyei on 2020. 08. 29..
//

import SwiftUI

struct IconButton: View {
    var title: String?
    var icon: String?
    var size: CGFloat = 44
    var color: Color
    var body: some View {
        if icon == nil {
            Text(title!.prefix(4))
                .foregroundColor(.white)
                .font(.medium18)
                .frame(width: size, height: size)
                .background(Circle().fill(color))
        }
        if icon != nil {
            Image(systemName: icon!)
                .foregroundColor(.white)
                .font(.medium18)
                .frame(width: size, height: size)
                .background(Circle().fill(color))
        }
    }
}

//struct IconButton_Previews: PreviewProvider {
//    static var previews: some View {
//        IconButton()
//    }
//}
