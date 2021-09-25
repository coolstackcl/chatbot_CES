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

ActiveRecord::Schema.define(version: 2021_09_23_023648) do

  create_table "asignaturacursos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "curso_id", null: false
    t.bigint "asignatura_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asignatura_id"], name: "index_asignaturacursos_on_asignatura_id"
    t.index ["curso_id"], name: "index_asignaturacursos_on_curso_id"
  end

  create_table "asignaturaprofesors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "profesor_id", null: false
    t.bigint "asignatura_id", null: false
    t.bigint "curso_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asignatura_id"], name: "index_asignaturaprofesors_on_asignatura_id"
    t.index ["curso_id"], name: "index_asignaturaprofesors_on_curso_id"
    t.index ["profesor_id"], name: "index_asignaturaprofesors_on_profesor_id"
  end

  create_table "asignaturas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cursos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "numero"
    t.string "letra"
    t.string "nivel"
    t.string "jornada"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "establecimientos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "ciudad"
    t.string "rbd"
    t.string "direccion"
    t.string "telefono"
    t.string "email"
    t.string "director"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profesorjeves", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "profesor_id", null: false
    t.bigint "curso_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curso_id"], name: "index_profesorjeves_on_curso_id"
    t.index ["profesor_id"], name: "index_profesorjeves_on_profesor_id"
  end

  create_table "profesors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "email"
    t.time "inicioatencion"
    t.time "finatencion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regasignaturas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asignatura_id", null: false
    t.bigint "establecimiento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asignatura_id"], name: "index_regasignaturas_on_asignatura_id"
    t.index ["establecimiento_id"], name: "index_regasignaturas_on_establecimiento_id"
  end

  create_table "regcursos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "establecimiento_id", null: false
    t.bigint "curso_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curso_id"], name: "index_regcursos_on_curso_id"
    t.index ["establecimiento_id"], name: "index_regcursos_on_establecimiento_id"
  end

  create_table "registros", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "establecimiento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["establecimiento_id"], name: "index_registros_on_establecimiento_id"
    t.index ["usuario_id"], name: "index_registros_on_usuario_id"
  end

  create_table "regprofesors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "profesor_id", null: false
    t.bigint "establecimiento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["establecimiento_id"], name: "index_regprofesors_on_establecimiento_id"
    t.index ["profesor_id"], name: "index_regprofesors_on_profesor_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "rol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "usuarios", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "email"
    t.string "password_digest"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_usuarios_on_role_id"
  end

  add_foreign_key "asignaturacursos", "asignaturas"
  add_foreign_key "asignaturacursos", "cursos"
  add_foreign_key "asignaturaprofesors", "asignaturas"
  add_foreign_key "asignaturaprofesors", "cursos"
  add_foreign_key "asignaturaprofesors", "profesors"
  add_foreign_key "profesorjeves", "cursos"
  add_foreign_key "profesorjeves", "profesors"
  add_foreign_key "regasignaturas", "asignaturas"
  add_foreign_key "regasignaturas", "establecimientos"
  add_foreign_key "regcursos", "cursos"
  add_foreign_key "regcursos", "establecimientos"
  add_foreign_key "registros", "establecimientos"
  add_foreign_key "registros", "usuarios"
  add_foreign_key "regprofesors", "establecimientos"
  add_foreign_key "regprofesors", "profesors"
  add_foreign_key "usuarios", "roles"
end
