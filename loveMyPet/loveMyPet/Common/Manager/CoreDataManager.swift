//
//  CoreDataManager.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 20/06/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "loveMyPet")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    let request: NSFetchRequest<Pet> = Pet.fetchRequest()
    
    func fetchAll() -> [Pet] {
        var pets = [Pet]()
        do {
            let fetchedPets = try self.container.viewContext.fetch(request)
            pets = fetchedPets
        } catch let error as NSError {
            print("\(error): Ocorreu um erro na busca de Pets")
        }
        return pets
    }
    
    func create(name: String, image: Data, gender: Gender, specie: Specie, breed: String, birthDate: Date, weight: Double, isNeutered: Bool) {
        let newPet = Pet(context: self.container.viewContext)
        newPet.id = UUID()
        newPet.name = name
        newPet.image = image
        newPet.gender = gender
        newPet.specie = specie
        newPet.breed = breed
        newPet.birthDate = birthDate
        newPet.weight = weight
        newPet.isNeutered = isNeutered
        saveData()
    }
    
    func saveData() {
        do {
            try self.container.viewContext.save()
        } catch let error as NSError {
            print("\(error): Não foi possível salvar os dados")
        }
    }
    
    func delete(pet: Pet) {
        self.container.viewContext.delete(pet)
        saveData()
    }
}