//
//  CepModel.swift
//  AsyncTest
//
//  Created by Swift on 21/06/17.
//  Copyright © 2017 HalphDem. All rights reserved.
//

import Foundation
import ObjectMapper

class CepModel: Mappable {
    
    var cep: String?
    var logradouro: String?
    var complemento: String?
    var bairro: String?
    var localidade: String?
    var uf: String?
    var unidade: String?
    var ibge: String?
    var gia: String?
    
    init(bairro: String) {
        self.bairro = bairro
    }
    
    required init!(map: Map) {
    
    }
    
    func mapping(map: Map) {
        cep <- map["cep"]
        logradouro <- map["logradouro"]
        complemento <- map["complemento"]
        bairro <- map["bairro"]
        localidade <- map["localidade"]
        uf <- map["uf"]
        unidade <- map["unidade"]
        ibge <- map["ibge"]
        gia <- map["gia"]
    }
}
