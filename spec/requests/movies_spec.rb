require "rails_helper"

RSpec.describe "Movies API", type: :request do
	describe "GET /movies" do
		it "returns all movies" do
			get "/rspec/movies"
		    expect(response).to have_http_status(:success)
		    expect(response.body.size).to eq(2)
		end
	end

	describe "POST /movies" do
		it "create new movie" do
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}
			expect(response.content_type).to eq("application/json; charset=utf-8")
			expect(response).to have_http_status(:success)
		end
	end	

	describe "GET /movies/:id" do
		it "show movie" do
			#first create item
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}

			#then get 1 item to show
			get "/rspec/movies/1"
			expect(response).to have_http_status(:success)
		end
	end	

	describe "PUT /movies/:id" do
		it "put movie" do
			#first create item
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}
			#then get 1 item to update
			put "/rspec/movies/1", :params => { 
				:movie => {
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				}
			}
			expect(response).to have_http_status(:success)
		end
	end	

	describe "DELETE /movies/:id" do
		it "destroy movie" do
			#first create item
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}
			#then get 1 item to delete
			delete "/rspec/movies/1"
			expect(response).to have_http_status(:success)
		end
	end

	describe "FILTER query sentences" do
		it "filter for :title" do
			get "/rspec/movies?title=101-dalmatas"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end

		it "filter for :genre" do
			#first create one genre 
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}
			get "/rspec/movies?genre=1"
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end

		it "filter for order" do 
			get "/rspec/movies?order=desc" #or asc
			expect(response.body.size).to eq(2)
			expect(response).to have_http_status(:success)
		end
	end

	describe "ASSOSIATION with Genres and Characters" do 
		it "Add genres to movie" do
			#first create movie item 
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}

			#after create one genre 
			post "/rspec/genres", :params => { 
					:genre => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Animation', 
					} 
				}

			#then post association
			post "/rspec/movies/1/genres", :params => {
				:movie_id => 1,
				:genre_id => 1
			} 

			expect(response).to have_http_status(:success)
		end

		it "Add characters to movie" do
			#first create movie item 
			post "/rspec/movies", :params => { 
				:movie => { 
					:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
					:title => '101 dalmatas', 
					:creation_date => '22/02/1962', 
					:qualification => '4.9' 
				} 
			}

			#after create one character 
			post "/rspec/characters", :params => { 
					:character => { 
						:image => 'https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/13845/13845_173x256.jpg', 
						:name => 'Anita', 
						:age => 25,
						:weight => '55kg',
						:history => 'she is owner of the dogs or she love so much to dogs'
					} 
				}

			#then post association
			post "/rspec/movies/1/characters", :params => {
				:movie_id => 1,
				:character_id => 1
			} 

			expect(response).to have_http_status(:success)
		end
	end
end
