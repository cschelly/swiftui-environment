//
//  ContentView.swift
//  Environment
//
//  Created by Christina S on 12/8/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Accessibility: sizeCategory Environment variable")
                .font(.title)
            ButtonsView()
            Text("Dark Mode: colorScheme Environment variable")
                .font(.title)
            ImagesView()
            ScrollView {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam ut venenatis tellus in metus vulputate eu. Eget magna fermentum iaculis eu non diam phasellus vestibulum lorem. Urna condimentum mattis pellentesque id nibh. Id interdum velit laoreet id donec ultrices tincidunt. Cursus in hac habitasse platea dictumst quisque sagittis. Felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices. Aliquet enim tortor at auctor urna. Maecenas accumsan lacus vel facilisis volutpat est. Vel fringilla est ullamcorper eget nulla facilisi etiam. Ut sem nulla pharetra diam sit amet nisl. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Quam pellentesque nec nam aliquam. Sed egestas egestas fringilla phasellus faucibus scelerisque. Mattis molestie a iaculis at erat pellentesque. Quis hendrerit dolor magna eget. At volutpat diam ut venenatis tellus in metus vulputate.")
                    .padding()
            }
        }
    }
}

struct ButtonsView: View {
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {
        return Group {
            if sizeCategory == .accessibilityExtraExtraExtraLarge {
                VStack {
                    Button(action: {
                        // ...
                    }) {
                        ButtonStyle("Extra Large Button", width: 300)
                    }
                }
            } else {
                HStack {
                    Button(action: {
                        // ...
                    }) {
                        ButtonStyle("Normal Button", width: 150)
                    }
                }
            }
        }
    }
}

struct ImagesView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        return Group {
            if colorScheme == .dark {
                ImageStyle("nighttime")
            } else {
                ImageStyle("daytime")
            }
        }
    }
}

struct ImageStyle: View {
    var image: String
    init(_ image: String) {
        self.image = image
    }
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 250, height: 167)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
            )
            .shadow(radius: 7)
    }
}

struct ButtonStyle: View {
    var text: String
    var width: CGFloat
    init(_ text: String, width: CGFloat) {
        self.text = text
        self.width = width
    }
    var body: some View {
        Text(text)
            .frame(width: width)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            // .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            // .environment(\.colorScheme, .dark)
    }
}
