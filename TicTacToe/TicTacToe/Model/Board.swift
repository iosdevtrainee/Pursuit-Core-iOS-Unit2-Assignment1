//
//  Board.swift
//  TicTacToe
//
//  Created by J on 11/14/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

protocol Board {
 // mutating func updateBoard(Board:Board)
  func add(piece: Piece, position:Position)
}

enum Piece: String {
  case x
  case o
  case blank
}



struct Position {
  var row: Int
  var col: Int
}
