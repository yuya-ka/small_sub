class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name #名前
      t.text :description #説明
      t.decimal :price #価格
      t.integer :quantity #数量
      t.integer :category #カテゴリー
      t.integer :status, default: 0 #ステータス

      t.timestamps
    end
  end
end
