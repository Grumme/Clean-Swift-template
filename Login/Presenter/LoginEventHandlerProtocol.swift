//
//  Created by Jakob Grumsen.
//  Copyright © 2018 Grumsen Development ApS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginEventHandlerProtocol {
    func willAppear()
    func prepare(for segue: UIStoryboardSegue)
}
