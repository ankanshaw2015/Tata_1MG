//
//  HomeViewModel.swift
//  1MG
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

class HomeViewModel : ObservableObject{
    
    static var shared:HomeViewModel = HomeViewModel()
    @Published var seletectedTab :Int = 0
    @Published var serchText:String = ""
}


