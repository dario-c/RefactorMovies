require 'top_movies'

describe "When you create a movie" do

  before(:each) do  
   @movie = Movie.new(20,130,"Red",10,2013)
   @movie2 = Movie.new(21,120,"Red - 2",3,2014)
  end

  it "It is created with its parameters" do
   
    expect(@movie.length).to eq(130)

  end


  xit "It can return a List with all the movies" do

    expect(Movie.all_movies).to be_a(Array)

  end

end


describe "We have a List of Movies" do 

  xit "Returns an Array with all the movies" do   
  
    expect(ListOfMovies.list).to be_a(Array)

  end




  it "has no movies at the beginning" do
    
    list = ListOfMovies.new
    expect(list.size).to eq 0
  end
 
  it "stores movies" do

    list = ListOfMovies.new
    movie = Movie.new 20,130,"Red",10,2013
    
    list.add movie

    expect(list.size).to eq 1
  end
 
  it "Filters movies" do

    list = ListOfMovies.new
    
    movie = Movie.new 20,130,"Red",10,2013
    movie2 = Movie.new 20,130,"Red-2",10,2013
    
    list.add movie
    list.add movie2

    list.filter
    
    expect(list.size).to eq(1)
     
   end 
end










describe TopMovies do
 it 'should order the movies' do
    movies = [{"id"=>54, "length"=>124, "title"=>"Gigi", "year"=>"1958", "popularity"=>50}, {"id"=>29, "length"=>125, "year"=>"1983", "popularity"=>1}]

    ordered_movies, grouped_movies = TopMovies.generate_top_lists(movies, true, 120, 12)
    expect(ordered_movies.first['popularity']).to be < ordered_movies.last['popularity']
  end


  it 'should filter the movies' do
    movies = [{"id"=>54, "length"=>124, "title"=>"Gigi", "year"=>"1958", "popularity"=>50}, {"id"=>29, "length"=>290, "year"=>"1983", "popularity"=>1}]

    ordered_movies, grouped_movies = TopMovies.generate_top_lists(movies, true, 120, 12)
    expect(ordered_movies.length).to be 1
    expect(ordered_movies.first["id"]).to be 54
  end


  it 'should group the movies' do
    movies = [{"id"=>54, "length"=>124, "title"=>"Gigi", "year"=>"1958", "popularity"=>50}, {"id"=>29, "length"=>125, "year"=>"1983", "popularity"=>1}]

    ordered_movies, grouped_movies = TopMovies.generate_top_lists(movies, true, 120, 12, true)
    expect(grouped_movies.keys).to match_array(["1958", "1983"])
  end

end

