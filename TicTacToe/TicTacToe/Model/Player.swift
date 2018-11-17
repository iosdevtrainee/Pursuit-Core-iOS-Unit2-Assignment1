//
//  Player.swift
//  TicTacToe
//
//  Created by J on 11/14/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct Player: Equatable, CustomStringConvertible {
  var description: String {
    return self.name
  }
  private var name:String
  
  public var piece: Piece
  
  init(piece:Piece, name:String) {
    self.piece = piece
    self.name = name
  }
  static func ==(lhs:Player,rhs:Player) -> Bool {
    return lhs.piece.rawValue == rhs.piece.rawValue
  }
  
}
