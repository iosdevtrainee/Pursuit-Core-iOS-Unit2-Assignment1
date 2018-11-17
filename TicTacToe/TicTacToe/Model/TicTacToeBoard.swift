//
//  TicTacToeBoard.swift
//  TicTacToe
//
//  Created by J on 11/14/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation


class TicTacToeBoard: Board {
  var positions: [[Piece]]
  
  init(rows:Int,cols:Int){
    let columns = Array(repeating: Piece.blank, count: cols)
    self.positions = Array(repeating: columns, count: rows)
  }
  func add(piece: Piece, position:Position){
    self.positions[position.row][position.col] = piece
  }
}
