require "swagger_helper"
require "requests/usuarios_spec"
require "cancan/matchers"

usuarioInfo = UsuarioInfo.new

RSpec.describe "productos", type: :request do
  path "/productos" do
    get("list productos") do
      tags "Producto"
      produces "application/json"
      response(200, "successful") do
        #subject(:ability) { Ability.new(user) }
        # let(:user) { nil }
        # it { is_expected.to be_able_to(:manage, Producto.new) }

        run_test!
      end
    end

    post("create producto") do
      tags "Producto"
      consumes "application/json"
      #security [{ bearer_auth: [] }]
      parameter name: :producto,
                in: :body,
                schema: {
                  "$ref" => "#/components/schemas/producto"
                }
      response(201, "successful") do
        let(:Authorization) { "Bearer #{usuarioInfo.token}" }
        let(:producto) { FactoryBot.build(:producto) }
        FactoryBot.create_list(:producto, 5)
        run_test!
      end
    end
  end

  path "/productos/{id}" do
    before(:all) { @productoPrueba = FactoryBot.create(:producto) }
    parameter name: "id",
              in: :path,
              type: :string,
              description: "id del producto"

    get("show one producto") do
      tags "Producto"
      produces "application/json"
      response(200, "successful") do
        let(:id) { @productoPrueba.id }

        run_test!
      end
    end

    patch("update producto") do
      tags "Producto"
      consumes "application/json"
      parameter name: :update_producto, in: :body
      response(200, "successful") do
        let(:id) { @productoPrueba.id }
        let(:update_producto) { FactoryBot.build(:producto) }
        run_test!
      end
    end

    put("update producto") do
      tags "Producto"
      consumes "application/json"
      parameter name: :update_producto, in: :body
      response(200, "successful") do
        let(:id) { @productoPrueba.id }
        let(:update_producto) { FactoryBot.build(:producto) }
        run_test!
      end
    end

    delete("delete producto") do
      tags "Producto"
      consumes "application/json"
      response(204, "successful") do
        let(:id) { @productoPrueba.id }
        let(:update_producto) { FactoryBot.build(:producto) }

        run_test!
      end
    end
  end
end
