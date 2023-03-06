require "swagger_helper"
require "requests/usuarios_spec"

usuarioInfo = UsuarioInfo.new
RSpec.describe "compras", type: :request do
  before(:all) { @compraPrueba = FactoryBot.create(:compra_with_orders) }
  path "/compras" do
    get("list compras") do
      tags "Compras"
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

    # post('create compra') do
    #   response(200, 'successful') do

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end

  path "/compras/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id", in: :path, type: :string, description: "id"

    get("muesta una compra especifica") do
      tags "Compras"
      produces "application/json"
      security [{ bearer_auth: [] }]
      response(200, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:id) { @compraPrueba.id }

        run_test!
      end
    end

    # patch('update compra') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # put('update compra') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # delete('delete compra') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
