//
//  CommentTextView.swift
//  weibo
//
//  Created by 彭智鑫 on 2021/3/28.
//

import SwiftUI

struct CommentTextView: UIViewRepresentable {
    @Binding var text: String
    
    let beginEditingOnAppear: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let view = UITextView()
        view.backgroundColor = .systemGray
        view.font = .systemFont(ofSize: 18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if beginEditingOnAppear, uiView.window != nil, !uiView.isFirstResponder, context.coordinator.didBecomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent: CommentTextView
        var didBecomeFirstResponder: Bool = false
        
        init(_ view: CommentTextView) {
            self.parent = view
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""), beginEditingOnAppear: true)
    }
}
