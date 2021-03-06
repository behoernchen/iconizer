//
// StringExtensions.swift
// Iconizer
// https://github.com/raphaelhanneken/iconizer
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Raphael Hanneken
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Cocoa

extension String {

  ///  Returns a string object containing the characters between the
  ///  given start and end characters. Excluding the given start and end
  ///  characters.
  ///
  ///  - parameter start: Starting point.
  ///  - parameter end:   End point.
  ///
  ///  - returns: Characters between the given start and end charaters.
  func substringFromCharacter(start: String, to end: String) -> String? {
    // Return nil in case either the given start or end string doesn't exist.
    guard let startIndex = self.rangeOfString(start),
      let endIndex   = self.rangeOfString(end)    else {
        return nil
    }

    return self.substringWithRange(Range(start: startIndex.endIndex, end: endIndex.startIndex))
  }
}
