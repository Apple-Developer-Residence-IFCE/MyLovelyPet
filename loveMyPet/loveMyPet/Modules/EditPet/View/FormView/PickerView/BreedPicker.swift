//
//  BreedPicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct BreedPicker: View {
    
    @EnvironmentObject private var viewModel: EditPetViewModel
        
    var body: some View {
        Picker("", selection: $viewModel.selectedPet.breed) {
            ForEach(viewModel.selectedPet.specie.breed , id: \.self) { breed in
                Text(breed)
                    .tag(breed)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Font.Regular, size: 16))
        .pickerStyle(.menu)
    }
}