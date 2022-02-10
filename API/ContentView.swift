//
//  ContentView.swift
//  API
//
//  Created by wdp mac on 10/02/22.
//

import SwiftUI

struct ContentView: View {
    let network = Network()
    @State var banks : Banks = Banks()
    
    var body: some View {
        if banks.count < 1 {
            Text("FetchingData")
                .padding()
                .onAppear {
                    network.getBankList{ result in
                         switch result {
                                case .success(let banksData) :
                                    self.banks = banksData
                                case .failure(let err):
                                    print("err------> \(err.localizedDescription)")
                            }
                    }
                }
        }else{
            Text("Fetched Done Total: \(banks.count)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
