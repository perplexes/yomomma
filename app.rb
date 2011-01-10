jokes = File.read('jokes.txt').split("\n\n").map(&:strip).map{|s| s.gsub(/\d+\. /, '')}

post '/' do
  @r = Twilio::Response.new
  
  @r.append(Twilio::Say.new(jokes.at(rand(jokes.size)), :voice => "man", :loop => "10"))
  @r.append(Twilio::Play.new("http://yomomma.heroku.com/102_ya_mama_matt_dike_remix_1.mp3"))
  @r.respond
end
