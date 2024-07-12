import SwiftUI

struct ContentView: View {
    @State var prefecture: String?
    @State var isShowModal = false
    
    var body: some View {
        //横並びで等間隔に表示
        HStack (spacing: 100){
            Text("都道府県")
            Text(prefecture ?? "未選択")
            Button("変更"){
                isShowModal = true
            }
            //isPresented->表示したいモーダルを指定し、trueの状態に。（モーダルが閉じられる際に、自動的にfalseに。）
            .fullScreenCover(isPresented: $isShowModal){
                //ModalView側のselectedPrefectureとContentView側のprefecture間でデータを共有
                ModalView(selectedPrefecture: $prefecture)
            }
        }
        VStack() {
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
