# frozen_string_literal: true

FactoryBot.define do
    factory :product do
      title         { "Product" }
      description   { "ist ein product" }
      image_url     { ".png" }
      price         { 20.11 }
    end
  end
