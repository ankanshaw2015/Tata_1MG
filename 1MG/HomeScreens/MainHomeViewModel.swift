//
//  MainHomeViewModel.swift
//  1MG
//
//  Created by Yashom on 16/10/24.
//

import Foundation

class MainViewModel:ObservableObject{
    @Published var show:Bool = false
    @Published var seletectedTab :Int = 0
    @Published var serchText:String = ""
    
}
