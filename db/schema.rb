# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_06_012914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carritos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.float "total"
    t.index ["usuario_id"], name: "index_carritos_on_usuario_id"
  end

  create_table "compras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.float "total"
    t.string "entrega"
    t.index ["usuario_id"], name: "index_compras_on_usuario_id"
  end

  create_table "ordenes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "producto_id"
    t.integer "compra_id"
    t.integer "carrito_id"
    t.integer "cantidad"
    t.float "total"
    t.index ["carrito_id"], name: "index_ordenes_on_carrito_id"
    t.index ["compra_id"], name: "index_ordenes_on_compra_id"
    t.index ["producto_id"], name: "index_ordenes_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.string "descripcion"
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cantidad"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usuario_id"
    t.string "nombre"
    t.string "imagen"
    t.integer "rol", default: 0
    t.string "calle"
    t.string "ciudad"
    t.string "estado"
    t.string "pais"
    t.integer "numero_casa"
    t.integer "telefono"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true
  end

  add_foreign_key "carritos", "usuarios"
  add_foreign_key "compras", "usuarios"
  add_foreign_key "ordenes", "carritos"
  add_foreign_key "ordenes", "compras"
  add_foreign_key "ordenes", "productos"
end
