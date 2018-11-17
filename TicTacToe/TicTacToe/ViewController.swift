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
  private var brain:TicTacToeBrain!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    brain = TicTacToeBrain()
  }
  
  private func setupBoard(){
    
  }
  
  @IBAction private func playerTurn(boardSlot:GameButton){
    let game = brain.updateBoard(position: [boardSlot.row,boardSlot.col])
    if game.won {
      print("\(game.player) Wins!")
    }
    boardSlot.setImage(UIImage(named:game.player.piece.rawValue), for: .normal)
  }
  private func addPieceImage(piece:Piece){
    
  }
}

