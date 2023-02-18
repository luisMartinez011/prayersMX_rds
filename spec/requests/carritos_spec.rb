require "swagger_helper"

RSpec.describe "carritos", type: :request do
  path "/carritos" do
    get("list carritos") do
      response(200, "successful") do
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
    parameter name: "id", in: :path, type: :string, description: "id"

    get("show carrito") do
      response(200, "successful") do
        let(:id) { "123" }

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

    delete("vacia el carrito y pasa las ordenes del carrito a compras") do
      response(200, "successful") do
        let(:id) { "123" }

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
  end
end
