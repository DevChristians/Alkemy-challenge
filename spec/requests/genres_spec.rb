require "rails_helper"

RSpec.describe "Genres API", type: :request do
	describe "GET /genres" do
		it "returns all genres" do
			get "/rspec/genres"
		    expect(response).to have_http_status(:success)
		    expect(response.body.size).to eq(2)
		end
	end

	describe "POST /genres" do
		it "create new genre" do
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}
			expect(response.content_type).to eq("application/json; charset=utf-8")
			expect(response).to have_http_status(:success)
		end
	end	

	describe "GET /genres/:id" do
		it "show genre" do
			#first create item
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}

			#then get 1 item to show
			get "/rspec/genres/1"
			expect(response).to have_http_status(:success)
		end
	end	

	describe "PUT /genres/:id" do
		it "put genre" do
			#first create item
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}
			#then get 1 item to update
			put "/rspec/genres/1", :params => { 
				:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
			}
			expect(response).to have_http_status(:success)
		end
	end	

	describe "DELETE /genres/:id" do
		it "destroy genre" do
			#first create item
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}
			#then get 1 item to delete
			delete "/rspec/genres/1"
			expect(response).to have_http_status(:success)
		end
	end
end