class Product < ApplicationRecord
  validates :name, presence: true

  enum category: { 電子: 0, 衣類: 1, 家具: 2, 食品: 3, 小物: 4 }
  enum status: { 在庫あり: 0, 入荷待ち: 1, 販売中止: 2 }
end
