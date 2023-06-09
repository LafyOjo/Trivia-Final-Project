//
//  GameScreen.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import SwiftUI

struct GameScreen: View {
    @State private(set) var isErrorOccured = false
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var gameViewModel: GameScreenViewModel
    var body: some View {
        ZStack{
            Image("BG2").resizable().edgesIgnoringSafeArea(.all)
            VStack(spacing: 40){
                HStack{
                    Text("Trivia").font(.title).foregroundColor(Color("AccentColor")).fontWeight(.heavy)
                    Spacer()
                    Text("\(gameViewModel.index + 1) / \(gameViewModel.length)").font(.title).foregroundColor(Color("AccentColor")).fontWeight(.light)
                }.navigationBarBackButtonHidden(true)
                
                ProgressBar(progress: gameViewModel.progress)
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(gameViewModel.question)
                        .padding().font(.system(size: 20)).bold().foregroundColor(Color("AccentColor"))
                    
                    ForEach(gameViewModel.answerChoices, id: \.id) { answer in
                        GameAnswer(answerModel: answer, gameViewModel: gameViewModel)
                        
                    }
                    
                }.onAppear{
                    Task{
                        await getAPIData()
                    }
                    
                }.refreshable {
                    await getAPIData()
                }
                
                if gameViewModel.answerSelected == true{
                    Button {
                       gameViewModel.coordinator = coordinator
                       gameViewModel.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background:   Color("AccentColor"))
                    }

                    
                   
                }else{
                    Button {
                        gameViewModel.coordinator = coordinator
                        gameViewModel.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background:  gameViewModel.answerSelected ? Color.purple : Color.gray)
                    }.disabled(!gameViewModel.answerSelected)
                
                    
                }
                
                    

                
                Spacer()
                
                
            }.padding().navigationBarBackButtonHidden(true)
        }
        
    }
    
    func getAPIData()async{
        await gameViewModel.getGameQuestions(withUrlString: APIEndPoint.endPointUrl)
        if gameViewModel.networkError != nil {
            isErrorOccured = true
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
