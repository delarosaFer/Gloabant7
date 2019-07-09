//
//  Result.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/17/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
// MARK: Result
/// A value that represents success or failure including an associated value
public enum Result<Success, Failure> where Failure: Error{
    case success(Success)
    case failure(Failure)
}
