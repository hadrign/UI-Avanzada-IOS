//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate a través del cual vamos a comunicar a la vista eventos que requiran pintar el UI, pasándole aquellos datos que necesita
protocol CategoriesViewDelegate: class {
    func categoriesFetched()
    func errorFetchingCategories()
}

/// ViewModel representando un listado de categorías
class CategoriesViewModel {
    //weak var coordinatorDelegate: CategoriesCoordinatorDelegate?
    weak var viewDelegate: CategoriesViewDelegate?
    let categoriesDataManager: CategoriesDataManager
    var categoriesViewModels: [CategoriesCellViewModel] = []

    init(categoriesDataManager: CategoriesDataManager) {
        self.categoriesDataManager = categoriesDataManager
    }

    func viewWasLoaded() {
        categoriesDataManager.fetchAllCategories{[weak self] (result) in
            switch result {
            case .success(let categoriesResponse):
                guard let categoriesUnw = categoriesResponse?.categoryList.categories else {return}
                //No se si aqui necesitaremos no bloquear el hilo principal
                categoriesUnw.forEach({categorie in self?.categoriesViewModels.append(CategoriesCellViewModel.init(category: categorie))})
                self?.viewDelegate?.categoriesFetched()
            case .failure(let error):
                print(error)
            }
        }
        /** TODO:
         Recuperar el listado de latest categories del dataManager
         Asignar el resultado a la lista de viewModels (que representan celdas de la interfaz
         Avisar a la vista de que ya tenemos categories listos para pintar
         */
    }

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return categoriesViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> CategoriesCellViewModel? {
        guard indexPath.row < categoriesViewModels.count else { return nil }
        return categoriesViewModels[indexPath.row]
    }
    
}
