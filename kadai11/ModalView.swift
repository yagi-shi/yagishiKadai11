//
//  ModalView.swift
//  kadai11
//
//  Created by 八木佑樹 on 2024/06/20.
//

import SwiftUI

struct ModalView: View {
    
    var prefectures = [
        "北海道", "青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県",
        "茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県",
        "新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県",
        "岐阜県", "静岡県", "愛知県", "三重県",
        "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県",
        "鳥取県", "島根県", "岡山県", "広島県", "山口県",
        "徳島県", "香川県", "愛媛県", "高知県",
        "福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"
    ]
    
    @Binding var selectedPrefecture: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            
            List {
                ForEach(prefectures, id: \.self) { prefecture in
                    HStack{
                        Text(prefecture)
                        //空白部分にもタップ判定を加えるために、「Spacer()」と「.contentShape(Rectangle())」を記載。
                        Spacer()
                    }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.selectedPrefecture = prefecture
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("都道府県")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            //戻るボタン生成および位置を指定。leading->左、trailing->右。
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
