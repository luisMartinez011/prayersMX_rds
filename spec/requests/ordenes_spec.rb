require "swagger_helper"

RSpec.describe "ordenes", type: :request do
  before(:all) { @ordenPrueba = FactoryBot.create(:ordene) }
  path "/ordenes" do
    get("list ordenes") do
      tags "Producto"
      produces "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :ordene,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/ordene"
                }
      response(200, "successful") { run_test! }
    end

    post("create orden and assigns it to a carrito") do
      tags "Producto"
      consumes "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :ordene,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/ordene"
                }
      response(201, "successful") do
        let(:ordene) do
          {
            producto_id: @ordenPrueba.producto_id,
            usuario_id: @ordenPrueba.carrito.usuario_id,
            cantidad: Faker::Number.number(digits: 2)
          }
        end

        run_test!
      end
    end
  end

  path "/ordenes/{id}" do
    # You'll want to customize the parameter types...
    #

    parameter name: "id",
              in: :path,
              type: :string,
              description: "id de la orden"

    get("show orden") do
      tags "Producto"
      produces "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :ordene,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/ordene"
                }
      response(200, "successful") do
        let(:id) { @ordenPrueba.id }

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

    patch("update orden") do
      tags "Producto"
      consumes "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :ordene,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/ordene"
                }
      response(200, "successful") do
        let(:id) { @ordenPrueba.id }
        let(:ordene) { FactoryBot.build(:ordene) }

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

    put("update ordene") do
      tags "Producto"
      consumes "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :ordene,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/ordene"
                }
      response(200, "successful") do
        let(:id) { @ordenPrueba.id }
        let(:ordene) { FactoryBot.build(:ordene) }

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

    delete("delete ordene") do
      tags "Producto"
      consumes "application/json"
      #security [{ bearer_auth: [] }]
      response(204, "successful") do
        let(:id) { @ordenPrueba.id }

        run_test!
      end
    end
  end
end
