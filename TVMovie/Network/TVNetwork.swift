//
//  TVNetwork.swift
//  TVMovie
//
//  Created by 장준모 on 2023/09/17.
//

import Foundation
import RxSwift

final class TVNetwork {
    private let network: Network<TVListModel>
    init(network: Network<TVListModel>) {
        self.network = network
    }
    
    func getTopRatedList() -> Observable<TVListModel> {
        return network.getItemList(path: "/tv/top_rated")
    }
}

// endpoint = "'https://api.themoviedb.org/3\(path)"
