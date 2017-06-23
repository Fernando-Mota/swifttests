//
//  ViewController.swift
//  AsyncTest
//
//  Created by Swift on 21/06/17.
//  Copyright © 2017 HalphDem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uf: UILabel!
    
    @IBOutlet weak var cep: UILabel!
    
    @IBOutlet weak var logradouro: UILabel!
    @IBOutlet weak var localidade: UILabel!
    @IBOutlet weak var ibge: UILabel!
    
    @IBOutlet weak var complemento: UILabel!
    @IBOutlet weak var bairro: UILabel!
    @IBOutlet weak var unidade: UILabel!
    @IBOutlet weak var gia: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func dotheShit(_ sender: UIButton) {
        
        let remote = RemoteRepository()
        
        remote.doRequest(callBack: {
            (cep: CepModel?, error: NSError?) in
            
            if let cepLocal = cep {
                self.cep.text = cepLocal.cep
                self.bairro.text = cepLocal.bairro
                self.complemento.text = cepLocal.complemento
                self.gia.text = cepLocal.gia
                self.ibge.text = cepLocal.ibge
                self.localidade.text = cepLocal.localidade
                self.logradouro.text = cepLocal.logradouro
                self.uf.text = cepLocal.uf
                self.unidade.text = cepLocal.unidade
            }
            
            print("Deu ruim")
        })
    }
}

