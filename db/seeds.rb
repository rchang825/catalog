# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.find_or_create_by!(name: "apple", price: 1.0)
Product.find_or_create_by!(name: "book", price: 12.0)
Product.find_or_create_by!(name: "carrot", price: 0.8)
Product.find_or_create_by!(name: "dr.pepper", price: 1.0)
