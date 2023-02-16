//
//  ContentView.swift
//  WarCardGame
//
//  Created by Derefaa Cline on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card5"
    @State private var cpuCard = "card7"
    @State private var playerScore = 0
    @State private var cpuscore = 0
    @State private var showAlert = false
    @State private var playerheader = "NoPlayer"
    
    var body: some View {
        ZStack{
        Image("background").ignoresSafeArea()
            VStack(spacing: -100){
            
            Spacer()
            Image("logo")
            Spacer()
            HStack(spacing: 30){
            Image(playerCard)
            Image(cpuCard)
        }
            Spacer()
          
                Button(action: {
                    
                    let playerRand = Int.random(in:2...14)
                    let cpuRand = Int.random(in:2...14)
                    if(playerRand > cpuRand){
                        playerScore += 1
                    }else if (cpuRand>playerRand){
                        cpuscore += 1
                    }
                  playerCard =
                    "card"+String(playerRand)
                  cpuCard = "card"+String(cpuRand)
                    if (cpuscore == 14) {
                        showAlert.toggle()
                        playerheader = "CPU"
                        
                        playerScore = 0
                        cpuscore = 0
                    }else if(playerScore == 14){
                        showAlert.toggle()
                        playerheader = "Player"
                        
                        playerScore = 0
                        cpuscore = 0
                    }
                    
                },label: {Image("dealbutton")}).alert(isPresented: $showAlert){
                    Alert.init(title: Text("Winner !!"), message: Text("\(playerheader) is the winner"), dismissButton: .default(Text("OK")))
                }
            Spacer()
            HStack(spacing: 70){
                
                VStack{
                    Text("Player")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    Text(String(playerScore))
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
                VStack{
                    Text("CPU")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    Text(String(cpuscore))
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                
                }
                
                
            }
            Spacer()
            
            
            
            
         
}
    }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
