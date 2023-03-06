require "swagger_helper"
require "requests/usuarios_spec"

usuarioInfo = UsuarioInfo.new
RSpec.describe "carritos", type: :request do
  before(:all) { @carritoPrueba = FactoryBot.create(:carrito_with_orders) }

  path "/carritos" do
    get("list carritos") do
      tags "Carritos"
      produces "application/json"
      security [{ bearer_auth: [] }]
      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    # post("create carrito") do
    #   response(200, "successful") do
    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         "application/json" => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end

  path "/carritos/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del carrito"

    get("show carrito") do
      tags "Carritos"
      produces "application/json"
      security [{ bearer_auth: [] }]
      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { @carritoPrueba.id }

        run_test!
      end
    end

    delete(
      "vacia el carrito y pasa las ordenes del carrito a compras, tambien envia un email de confirmacion de compra"
    ) do
      tags "Carritos"
      consumes "application/json"
      security [{ bearer_auth: [] }]
      parameter name: :usuario_id,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/new_carrito"
                }
      response(204, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { @carritoPrueba.id }
        let(:usuario_id) { { usuario_id: @carritoPrueba.usuario_id } }

        run_test!
      end
    end
    # patch("update carrito") do
    #   response(200, "successful") do
    #     let(:id) { "123" }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         "application/json" => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # put("update carrito") do
    #   response(200, "successful") do
    #     let(:id) { "123" }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         "application/json" => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
