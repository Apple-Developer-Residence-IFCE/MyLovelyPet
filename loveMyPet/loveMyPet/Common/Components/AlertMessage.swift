//
//  AlertMessage.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct AlertMessageBuilder: ViewModifier {
    @Binding var isShowing: Bool
    var handleDelete: () -> Void

    func body(content: Content) -> some View {
        content
            .alert("Deseja excluir o cadastro?",isPresented: $isShowing) {
                Button("Excluir") {
                    handleDelete()
                    isShowing = false
                }
                Button("Cancelar", role: .cancel) { }
            } message: {
                Text("Uma vez excluida, essa ação não pode ser desfeita.")
            }
    }
}
