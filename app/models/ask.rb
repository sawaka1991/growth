class Ask < ApplicationRecord

	enum reply:{有: 0,無: 1}
	enum about:{商品について: 0,ご予約について: 1,Growthについて: 2,その他: 3}
	enum status:{受付: 0,終了: 1}


end
