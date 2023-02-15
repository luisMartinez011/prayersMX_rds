require "swagger_helper"
require "rails_helper"

newUsuario = FactoryBot.attributes_for(:usuario)

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
                  type: :object,
                  properties: {
                    email: {
                      type: :string
                    },
                    password: {
                      type: :string
                    },
                    name: {
                      type: :string
                    },
                    role: {
                      type: :string
                    }
                  }
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
                  type: :object,
                  properties: {
                    email: {
                      type: :string
                    },
                    password: {
                      type: :string
                    },
                    name: {
                      type: :string
                    },
                    role: {
                      type: :string
                    }
                  }
                }

      response(200, "successful") do
        newUsuario
        run_test! do |response|
          data = JSON.parse(response.body)

          usuarioToken = data["Authorization"]
        end
      end
    end
  end
end
