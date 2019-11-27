//
//  ViewController.swift
//  Hysaendi_Giocodei15
//
//  Created by ENDI HYSA on 30/10/2019.
//  Copyright © 2019 ENDI HYSA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ArrButtons: [UIButton]!
    
    var mat = [[1, 2, 3, 4],
               [5, 6, 7, 8],
               [9, 10, 12, 12],
               [13, 14, 15, 0]]
    
    @IBAction func btnMescola(_ sender: Any) {
        
        trovaLoZero()
        scombinaMatrice(mosse: 1)
        switchBottoni()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
   
    func scombinaMatrice (mosse : Int)
    {
        var r = 0
        var posZero = trovaLoZero()
        var x = posZero.0
        var y = posZero.1
        for _ in 0...mosse
        {
            r = Int.random(in: 0...3)
            if (r == 0)
            {
                if( y > 0)      //sposta in su
                {
                    mat [x][y] = mat [x][y-1]
                    y -= 1
                    mat [x][y] = 0
                    
                }
            }
            else if (r == 1)
            {
                if (x < 3)                      //sposta a destra
                {
                   mat [x][y] = mat [x+1][y]
                   x += 1
                   mat [x][y] = 0
                }
            }
            else if (r == 2)                //sposta giù
            {
                if ( y < 3)
                {
                    mat [x][y] = mat [x][y+1]
                    y += 1
                    mat [x][y] = 0
                }
            }
            else if (r == 3)            //sposta a sinistra
            {
                if ( x > 0)
                {
                    mat [x][y] = mat [x-1][y]
                    x -= 1
                    mat[x][y] = 0
                }
            }
        }
        
        
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
        var x = 0
        var y = 0
        for _ in 0...15
        {
            if (x==3)
            {
            ArrButtons[y*4+x].setTitle(String(mat[y][x]),for:.normal)
                x = 0
                y = y + 1
        }
            else
            {
            ArrButtons[y*4+x].setTitle(String(mat[y][x]),for:.normal)
                x = x + 1
            }
        
    }


    }
}


