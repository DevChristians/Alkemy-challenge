require "rails_helper"

RSpec.describe "Characters API", type: :request do
	describe "GET /characters" do
		it "returns all characters" do
			get "/rspec/characters"
		    expect(response).to have_http_status(:success)
		    expect(response.body.size).to eq(2)
		end
	end

	describe "POST /characters" do
		it "create new character" do
			post "/rspec/characters", :params => { 
					:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					} 
				}
			expect(response.content_type).to eq("application/json; charset=utf-8")
			expect(response).to have_http_status(:success)
		end
	end	

	describe "GET /characters/:id" do
		it "show character" do
			#first create item
			post "/rspec/characters", :params => { 
					:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					} 
				}

			#then get 1 item to show
			get "/rspec/characters/1"
			expect(response).to have_http_status(:success)
		end
	end	

	describe "PUT /characters/:id" do
		it "put character" do
			#first create item
			post "/rspec/characters", :params => { 
					:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					} 
				}
			#then get 1 item to update
			put "/rspec/characters/1", :params => { 
				:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					}
			}
			expect(response).to have_http_status(:success)
		end
	end	

	describe "DELETE /characters/:id" do
		it "destroy character" do
			#first create item
			post "/rspec/characters", :params => { 
					:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					} 
				}
			#then get 1 item to delete
			delete "/rspec/characters/1"
			expect(response).to have_http_status(:success)
		end
	end

	describe "FILTER query sentences" do
		it "filter for :name" do
			get "/rspec/characters?name=anita"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end

		it "filter for :age" do
			get "/rspec/characters?age=25"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end

		it "filter for :weight" do
			get "/rspec/characters?weight=55"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end

		it "filter for :movie" do
			#first create movie
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}
			#then go search
			get "/rspec/characters?movies=1"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end
	end
end