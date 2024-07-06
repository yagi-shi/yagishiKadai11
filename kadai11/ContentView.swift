//
//  ContentView.swift
//  kadai11
//
//  Created by 八木佑樹 on 2024/06/15.
//

import SwiftUI

struct ContentView: View {
    @State var prefecture: String?
    @State var isShowModal = false
//    @State var selectedPrefecture : String?
    
    var body: some View {
        //横並びで等間隔に表示
        HStack (spacing: 100){
            Text("都道府県")
            Text(prefecture ?? "未選択")
            Button("変更"){
                isShowModal = true
            }
            //isPresented->表示したいモーダル、onDismiss->モーダルが閉じられた時の挙動定義
            .fullScreenCover(isPresented: $isShowModal){
                ModalView(selectedPrefecture: $prefecture)
            }
        }
        
        VStack() {
            //下記コードを置いた位置に、スペースを作るイメージ
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
