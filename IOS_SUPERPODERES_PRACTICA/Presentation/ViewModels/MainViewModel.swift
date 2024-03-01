//
//  MainViewModel.swift
//  IOS_SUPERPODERES_PRACTICA
//
//  Created by Daniel Serrano on 27/2/24.
//

import Foundation
import SwiftUI
public let CONST_TOKEN_ID = "TokenKeyAppIOS"

class MainViewModel: ObservableObject{
    @Published var status = Status.login
    @Published var token : String = ""{
        didSet{
            saveKC(key: CONST_TOKEN_ID, value: token)
        }
    }
    
    init()
    {
        logControl()
    }
    
    func logControl(){
        token = loadKc(key: CONST_TOKEN_ID)
        if token.count > 0 {
            status = .heroesList
        }else{
            status = .login
        }
    }
    

    
    
    func fakeLogin() ->String{
        status = Status.loading

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            self.status = Status.heroesList
        }
         token = "tokenfake.sdlkfjklsjfljf"
        return token
        
    }
    
    
    
    
}
