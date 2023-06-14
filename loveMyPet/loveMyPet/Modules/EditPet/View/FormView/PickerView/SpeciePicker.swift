//
//  SpeciePicker.swift
//  loveMyPet
//
//  Created by Ravi navarro on 28/05/23.
//

import SwiftUI

struct SpeciePicker: View {
    @EnvironmentObject private var viewModel: EditPetViewModel

    var body: some View {
        Picker("", selection: $viewModel.selectedPet.specie) {
            ForEach(Specie.allCases) { specie in
                Text(specie.rawValue)
            }
        }
        .accentColor(Color("Gray-8C8C8B"))
        .font(.custom(Font.Regular, size: 16))
        .pickerStyle(MenuPickerStyle())
    }
}
