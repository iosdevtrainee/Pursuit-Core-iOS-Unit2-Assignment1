//
//  ViewController.swift
//  TicTacToe
//
//  Created by J on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet private var allGameButtons: [GameButton]!
  @IBOutlet weak var gameStatusLabel: UILabel!
  private var brain:TicTacToeBrain!
  private var gameOn: Bool = false
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    allGameButtons.forEach{ $0.isUserInteractionEnabled = gameOn}
  }
  
  private func setupBoard(){
    allGameButtons.forEach {$0.isUserInteractionEnabled = true}
  }
  
  @IBAction private func playerTurn(boardSlot:GameButton){
    let game = brain.updateBoard(position: (row:boardSlot.row,col:boardSlot.col))
    addPieceImage(piece: game.player.piece, button: boardSlot)
    if game.won == .win {
      print("\(game.player) Wins!")
    }
    
  }
  private func addPieceImage(piece:Piece, button:GameButton){
    button.setImage(UIImage(named:piece.rawValue), for: .normal)
  }
  
  private func startGame(){
    brain = TicTacToeBrain()
  }
  
//  private func resetGame(){
//
//  }
}

