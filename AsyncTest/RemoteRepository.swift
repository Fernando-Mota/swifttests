//
//  RemoteRepository.swift
//  AsyncTest
//
//  Created by Swift on 21/06/17.
//  Copyright © 2017 HalphDem. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RemoteRepository {
    
    func doRequest(callBack: @escaping (_ cep: CepModel?, _ error: NSError?) -> Void) {

        Alamofire.request("https://viacep.com.br/ws/01001000/json/").responseObject {
            (response: DataResponse<CepModel>) in
            
            
            guard response.result.error == nil else {
                callBack(nil, NSError(domain: "Deu ruim", code: 666, userInfo: [:]))
                return
            }
            
            guard let cep = response.result.value else {
                callBack(nil, NSError(domain: "Deu ruim", code: 666, userInfo: [:]))
                return
            }
            
            callBack(cep, nil)
        }
    }


}
