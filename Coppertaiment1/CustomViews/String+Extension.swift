//
//  String+Extension.swift
//  Coppertaiment1
//
//  Created by Apps2M on 2/3/23.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
