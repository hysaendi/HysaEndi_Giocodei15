//
//  ViewController.swift
//  Hysaendi_Giocodei15
//
//  Created by ENDI HYSA on 30/10/2019.
//  Copyright © 2019 ENDI HYSA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_Mosse: UILabel!
    @IBOutlet var ArrButtons: [UIButton]!
    var mos = 0
    var mat = [[1, 2, 3, 4],
               [5, 6, 7, 8],
               [9, 10, 11, 12],
               [13, 14, 15, 0]]
    
    @IBAction func btnMescola(_ sender: Any) {
        
        trovaLoZero()
        scombinaMatrice(mosse: 100)
        switchBottoni()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
   
    func scombinaMatrice (mosse : Int)
    {
        
        var r = 0
        var posizioneZero = trovaLoZero()
        var x = posizioneZero.1
        var y = posizioneZero.0
        for _ in 0...mosse
        {
            r = Int.random(in: 0...3)
            if (r == 0)
            {
                if( y > 0)      //sposta in su
                {
                    mat [y][x] = mat [y - 1][x]
                    y -= 1
                    mat [y][x] = 0
                    
                }
            }
            else if (r == 1)
            {
                if (x < 3)                      //sposta a destra
                {
                   mat [y][x] = mat [y][x + 1]
                   x += 1
                   mat [y][x] = 0
                   
                }
            }
            else if (r == 2)                //sposta giù
            {
                if ( y < 3)
                {
                    mat [y][x] = mat [y + 1][x]
                    y += 1
                    mat [y][x] = 0
                    
                }
            }
            else if (r == 3)            //sposta a sinistra
            {
                if ( x > 0)
                {
                    mat [y][x] = mat [y][x - 1]
                    x -= 1
                    mat[y][x] = 0
                   
                }
            }
        }
        lbl_Mosse.text = String (0)
        mos = 0
        
        
    }
    
  
    
    @IBAction func spostaCella(_ sender: Any) {
        
        var cella : Int!
        cella = ArrButtons.firstIndex(of: sender as! UIButton)
        var y = cella/4
        var x = cella%4
        
        
        if (x > 0)
        {
            if (mat[y][x-1] == 0)        //sposto a sinistra la casella e scambio il valore
            {
                mat[y][x-1] = mat [y][x]
                mat[y][x] = 0
                mos = mos + 1
            }
        }
        if (y > 0)
        {
            if (mat[y-1][x] == 0)        //sposto in giu la casella e scambio il valore
            {
                mat[y-1][x] = mat[y][x]
                mat[y][x] = 0
                mos = mos + 1
            }
        }
         if (x < 3)
        {
            if (mat[y][x+1] == 0)        //sposto a destra la casella e scambio il valore
            {
                mat[y][x+1] = mat[y][x]
                mat[y][x] = 0
                mos = mos + 1
            }
        }
        if (y < 3)
        {
            if (mat[y+1][x] == 0)       //sposto in su la casella e scambio il valore
            {
                mat[y+1][x] = mat[y][x]
                mat[y][x] = 0
                mos = mos + 1
            }
        }
        switchBottoni()    //aggiorno la parte grafica
        lbl_Mosse.text = String(mos)   //conto le mosse
        controllaVittoria()
    
    }
    
    func trovaLoZero () -> (Int,Int)
      {
          for i in 0...3
          {
              for p in 0...3
              {
                  if mat[i][p] == 0
                  {
                      return (i, p)
                  }
              }
          }
          return (-1, -1)     //caso impossibile nel quale non c'e lo zero
      }
      
    func switchBottoni ()
      {
          for y in 0...3
          {
              for x in 0...3
              {
                  ArrButtons [y*4+x].setTitle(String(mat[y][x]),        for:.normal)
              }
          }
       
      }
    
    func numInz ()
    {
        var mat =     [[1, 2, 3, 4],
                      [5, 6, 7, 8],
                      [9, 10, 11, 12],
                      [13, 14, 15, 0]]
        
    }
    
    func controllaVittoria ()
    {
        var corretto = true
        var mat2 = mat
        numInz()
        for i in 0...15
        {
            if (mat2[i] == mat[i]){}
            else
            {
                corretto = false
            }
        }
        if (corretto == true)
        {
            let alert = UIAlertController(title: "Hai vinto", message: "Congratulazioni", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")}))
        }
   
}
}
               
        


    



