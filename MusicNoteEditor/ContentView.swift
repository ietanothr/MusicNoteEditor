//
//  ContentView.swift
//  MusicNoteEditor
//
//  Created by adc@shibuyasoft on 2024/10/11.
//

import SwiftUI

struct MusicNote: Identifiable {
    let id = UUID()
    let noteName: String // 音符のテキスト（例: "♩", "♪"など）
    let xPosition: CGFloat // 水平方向の位置
    let yPosition: CGFloat // 垂直方向の位置
}

struct ContentView: View {
    let staffHeight: CGFloat = 100
    let staffSpacing: CGFloat = 20 // 五線譜の間隔
    let notes: [MusicNote] = [
        MusicNote(noteName: "♩", xPosition: 30, yPosition: 60),
        MusicNote(noteName: "♪", xPosition: 70, yPosition: 40),
        MusicNote(noteName: "♬", xPosition: 110, yPosition: 80)
    ]
    
    var body: some View {
        ZStack {
            // 五線譜の描画
            ForEach(0..<5) { line in
                Path { path in
                    let y = CGFloat(line) * staffSpacing + 20
                    path.move(to: CGPoint(x: 20, y: y))
                    path.addLine(to: CGPoint(x: 300, y: y))
                }
                .stroke(Color.black, lineWidth: 1)
            }
            
            // 音符の配置
            ForEach(notes) { note in
                Text(note.noteName)
                    .font(.system(size: 24))
                    .position(x: note.xPosition, y: note.yPosition)
            }
        }
        .frame(width: 320, height: staffHeight + 40)
    }
}


#Preview {
    ContentView()
}
