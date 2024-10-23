//
//  LoadingView.swift
//  1MG
//
//  Created by Yashom on 22/10/24.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var viewModel:MainViewModel
    var body: some View {
        ZStack{
            Image("map")
            VStack{
                ProgressView()
                Text("Delivering to")
                    .foregroundColor(.gray)
                    .bold()
                Text(viewModel.deliveringTo)
                    .font(.title)
                    .bold()
            }
        }
       
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .environmentObject(MainViewModel())
    }
}
