# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
    describe 'index' do
        it 'gets loaded' do
            get :index
            expect(response).to be_succes
            expect(assigns(:products)).not_to be_empty
        end
    end
    describe 'new' do
        it 'is succesfull' do
            get :new
            expect(response).to be_succes
        end
    end
    describe 'create' do
        it 'is succesfull' do
            expect{ post :create, params: {
                product: {
                title: "title",
                description: "test",
                image_url: ".png",
                price: 22.22 
            }}}.to change(Product, :count).by(1)
        end
    
        it 'redirects succesfully' do
            expect( post :create, params: {
                product: {
                title: "title",
                description: "test",
                image_url: ".png",
                price: 22.22 
            }}).to redirect_to product_path(assigns(:product))
        end
    end

    describe 'update' do
        let!(:product) {create(:product)}
        let(:params) { { params: { id: product.id, product: { title: 'Neuer Name' }}}}
        
        it 'redirects succesfully' do
            expect(put :update, params).to redirect_to product_path(assigns(:product))
        end
    end
end