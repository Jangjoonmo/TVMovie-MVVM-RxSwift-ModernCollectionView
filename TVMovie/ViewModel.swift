//
//  ViewModel.swift
//  TVMovie
//
//  Created by 장준모 on 2023/09/17.
//

import Foundation
import RxSwift

class ViewModel {
    
    let disposeBag = DisposeBag()
    private let tvNetwork: TVNetwork
    private let movieNetwork: MovieNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNetwork = provider.makeTVNetwork()
        movieNetwork = provider.makeMovieNetwork()
        
    }
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
        let movieResult: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        
        //trigger -> 네트워크 -> Observable<T> -> VC 전달 -> VC에서 구독
        
        // tvTrigger -> Observable<Void> -> Observable<[TV]>
        
        let tvList = input.tvTrigger.flatMapLatest{ [unowned self] _ -> Observable<[TV]> in
            // Observable<TVListModel> -> Observable<[TV]>
            self.tvNetwork.getTopRatedList().map{ $0.results }
            
        }
        
        let movieResult = input.movieTrigger.flatMapLatest{ [unowned self] _ -> Observable<MovieResult> in
            // combineLatest - 여러가지를 모두 가져와서 합칠 경우
            //Observable 1, 2, 3을 합쳐서 하나의 Observable로 바꾸고 싶다면?
            return Observable.combineLatest(self.movieNetwork.getUpcomingList(), self.movieNetwork.getPopularList(), self.movieNetwork.getNowPlayingList()) { upcoming, popular, nowPlaying -> MovieResult in
                return MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying)
            }
            
        }
        
        return Output(tvList: tvList, movieResult: movieResult )
    }
}
