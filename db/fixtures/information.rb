Information.seed do |s|
	s.id = 1
	s.title = "チーズスフレ始めました"
	s.body = "大人気のチーズスフレ、生産再開しました。お土産にぜひいかがでしょうか。"
	s.image_id = Rails.root.join("db/fixtures/images/sfle.jpg").open
end

Information.seed do |s|
	s.id = 2
	s.title = "白樺ロール"
	s.body = "北海道産の順生クリームをたっぷりと使用し、きめ細かなフワッフワ生地で包み込みました。バニラの風味濃厚さをより際立たせます。生クリーム好きにはたまらない濃厚ロールケーキ。"
	s.image_id = Rails.root.join("db/fixtures/images/role.jpg").open
end

Information.seed do |s|
	s.id = 3
	s.title = "シュークリーム"
	s.body = "さらに大きくなりました！"
	s.image_id = Rails.root.join("db/fixtures/images/fresh.jpg").open
end

Information.seed do |s|
	s.id = 4
	s.title = "抹茶フォンダン新発売"
	s.body = "新茶の季節がやってきました！濃厚抹茶のフォンダンスフレ新発売です。トロッと濃厚抹茶がとっても美味しいです。ぜひお立ち寄りください。"
	s.image_id = Rails.root.join("db/fixtures/images/greentea.jpg").open
end

Information.seed do |s|
	s.id = 5
	s.title = "クリスマスケーキ予約開始"
	s.body = "クリスマスケーキ１１月１日より、予約開始です。人気のケーキは数量限定のため、お早めにご予約をお願いいたします。"
	s.image_id = Rails.root.join("db/fixtures/images/role.jpg").open
end

Information.seed do |s|
	s.id = 6
	s.title = "バレンタイン限定マカロン"
	s.body = "バレンタイン限定マカロン新発売。数量限定なのでお早めに！"
	s.image_id = Rails.root.join("db/fixtures/images/valentine.jpg").open
end

Information.seed do |s|
	s.id = 7
	s.title = "北海道チーズ"
	s.body = "人気のチーズケーキ新発売！"
	s.image_id = Rails.root.join("db/fixtures/images/home3.jpg").open
end

Information.seed do |s|
	s.id = 8
	s.title = "Happy Mother's day"
	s.body = "母の日限定ケーキ新発売！！ラズベリームースの可愛いケーキ。ご家族でぜひお召し上がりください。"
	s.image_id = Rails.root.join("db/fixtures/images/mother.jpg").open
end