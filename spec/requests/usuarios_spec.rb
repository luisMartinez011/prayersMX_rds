require "swagger_helper"
require "rails_helper"

newUsuario = FactoryBot.attributes_for(:usuario)

class UsuarioInfo
  def token
    return $usuarioToken
  end
end

RSpec.describe "usuarios", type: :request do
  let! (:new_usuario) {
    newUsuario
  }
  path "/auth/" do
    post("sign up usuario") do
      tags "Usuario"
      consumes "application/json"
      parameter name: :new_usuario,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/usuario"
                }

      response(200, "successful") do
        newUsuario
        run_test!
      end

      # response(422, "bad parameters") do
      #   let(:new_usuario) { { email: "admin", password: "contra" } }
      #   run_test!
      # end
    end
  end

  path "/auth/sign_in" do
    post("sign in usuario") do
      tags "Usuario"
      consumes "application/json"

      parameter name: :new_usuario,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/usuario"
                }

      response(200, "successful") do
        newUsuario
        run_test! do |response|
          data = JSON.parse(response.body)

          $usuarioToken = data["Authorization"]
        end
      end
    end
  end

  path "/usuarios" do
    get("list usuarios") do
      tags "Usuario"
      produces "application/json"
      response(200, "successful") do
        #subject(:ability) { Ability.new(user) }
        # let(:user) { nil }
        # it { is_expected.to be_able_to(:manage, Producto.new) }

        run_test!
      end
    end
  end

  path "/usuarios/{id}" do
    before(:all) { @usuarioPrueba = FactoryBot.create(:usuario) }
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del producto"

    get("show one usuario") do
      tags "Usuario"
      produces "application/json"
      response(200, "successful") do
        let(:id) { @usuarioPrueba.id }

        run_test!
      end
    end

    delete("delete producto") do
      tags "Usuario"
      consumes "application/json"
      response(204, "successful") do
        let(:id) { @usuarioPrueba.id }

        run_test!
      end
    end
  end
end
