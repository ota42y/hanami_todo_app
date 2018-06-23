Hanami::Model.migration do
  change do
    create_table :todos do
      primary_key :id

      column :title, String, null: false

      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
