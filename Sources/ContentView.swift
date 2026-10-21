import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("提词器 App MVP 已安装成功 🎉")
                .foregroundStyle(.secondary)
            Text("下一里程碑：滚动提词 + 画中画悬浮")
                .font(.footnote)
                .foregroundStyle(.tertiary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
