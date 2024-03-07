//
//  Created by Alex.M on 06.06.2022.
//

import Foundation
import SwiftUI

struct PermissionsErrorView: View {

    let text: String
    let action: (() -> Void)?

    @Environment(\.mediaPickerTheme) private var theme
    
    var body: some View {
        Group {
            if let action = action {
                Button {
                    action()
                } label: {
                    Text(text.localized)
                }
            } else {
                Text(text)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(theme.error.tint)
        .background(theme.error.background)
        .cornerRadius(5)
        .padding(.horizontal, 20)
    }
}

extension String {

  var localized: String {
    return NSLocalizedString(self, comment: "\(self)_comment")
  }
  
  func localized(_ args: [CVarArg]) -> String {
    return localized(args)
  }
  
  func localized(_ args: CVarArg...) -> String {
    return String(format: localized, args)
  }
}
