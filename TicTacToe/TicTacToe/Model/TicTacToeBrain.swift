//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by J on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class TicTacToeBrain {
  var currentPlayer: Player
  private var counter = 0
  /*= Player {
   return self.currentPlayer == self.playerOne ? self.playerTwo : self.playerOne
   }
   */
  private var playerOne: Player
  private var playerTwo: Player
  private var board: TicTacToeBoard {
    didSet {
      self.toggle()
      counter += 1
    }
  }
  init() {
    self.playerOne = Player.init(piece: Piece.x, name:"Player 1")
    self.playerTwo = Player.init(piece: Piece.o, name:"Player 2")
    self.currentPlayer = self.playerOne
    self.board = TicTacToeBoard(rows: 3, cols: 3)
  }
  public func checkIfPlayerWon(position:Position,piece:Piece) -> (player:Player,won:Bool){
//    let firstCheck = checkDiagonal(position: position, piece: piece, matrix: board.positions)
    let diagonalsWon = checkDiagonals(position: position, piece: piece)
    let rowsWon = checkRow(position: position, piece: piece)
    let colsWon = checkColumn(position: position, piece: piece)
    if diagonalsWon || rowsWon || colsWon {
      return (player:currentPlayer,won:true)
    }
    return (player:currentPlayer,won:false)
  }
  
  private func checkRow(position:Position, piece:Piece) -> Bool {
    let row = board.positions[position.row]
    return (row.filter {$0.rawValue == piece.rawValue}).count == row.count
  }
  
  private func checkColumn(position:Position, piece:Piece) -> Bool{
    for row in (0..<board.positions.count){
      if piece != board.positions[row][position.col]{
        return false
      }
    }
    return true
  }
  private func checkDiagonals(position:Position, piece:Piece) -> Bool{
//    guard var colsize = board.positions.first?.count else { return false}
//    colsize = colsize - 1
//    if position.row == position.col || position.col == colsize - position.row{
//      var counterDiagonal = 0
//      var counterOffDiagonal = 0
//      for col in (0..<colsize) {
//        counterDiagonal = board.positions[col][col] == piece ?  counterDiagonal + 1 : counterDiagonal
//        counterOffDiagonal = board.positions[col][colsize - col] == piece ?
//        counterOffDiagonal + 1 : counterOffDiagonal
//      }
//      if counterDiagonal == colsize + 1 || counterOffDiagonal == colsize + 1 {
//        return true
//      }
//    }
//    return false
    let firstCheck = checkDiagonal(position: position, piece: piece, matrix: board.positions)
    let secondCehck = checkOffDiagonal(position: position, piece: piece)
    return firstCheck || secondCehck
  }
  private func checkDiagonal(position:Position, piece:Piece, matrix:[[Piece]]) -> Bool{
    guard let rowSize = matrix.first?.count else { return false }
      for row in (0..<rowSize){
        if matrix[row][row] != piece {
          return false
        }
      }
      return true
  }
  private func checkOffDiagonal(position:Position, piece:Piece) -> Bool{
    let matrix = board.positions.map {Array($0.reversed())}
    return checkDiagonal(position: position, piece: piece, matrix: matrix)
  }
  private func toggle(){
    self.currentPlayer = self.currentPlayer == self.playerOne ? self.playerTwo : self.playerOne
  }
  public func updateBoard(position:[Int]) -> (player:Player,won:Bool){
    if let row = position.first, let col = position.last {
      let boardPosition = Position.init(row: row, col: col)
      return checkIfPlayerWon(position: boardPosition, piece: currentPlayer.piece)
    }
    print("Enter an array with only two elements")
    return (player:currentPlayer, won:false)
  }
}

