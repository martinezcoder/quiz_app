require 'sinatra'

set :bind, '0.0.0.0'

get '/api' do
  content_type :json
  { "response_code": 0,
    "results": [
      {"category":"Animals","type":"multiple","difficulty":"medium","question":"A carnivorous animal eats flesh, what does a nucivorous animal eat?","correct_answer":"Nuts","incorrect_answers":["Nothing","Fruit","Seaweed"]},
      {"category":"Animals","type":"multiple","difficulty":"easy","question":"The K\u0101k\u0101p\u014d is a large, flightless, nocturnal parrot native to which country?","correct_answer":"New Zealand","incorrect_answers":["South Africa","Australia","Madagascar"]},
      {"category":"Animals","type":"multiple","difficulty":"medium","question":"Cashmere is the wool from which kind of animal?","correct_answer":"Goat","incorrect_answers":["Sheep","Camel","Llama"]},
      {"category":"Animals","type":"multiple","difficulty":"easy","question":"How many legs do butterflies have?","correct_answer":"6","incorrect_answers":["2","4","0"]},
      {"category":"Animals","type":"multiple","difficulty":"hard","question":"What scientific suborder does the family Hyaenidae belong to?","correct_answer":"Feliformia","incorrect_answers":["Haplorhini","Caniformia","Ciconiiformes"]},
      {"category":"Animals","type":"multiple","difficulty":"hard","question":"How many known living species of hyenas are there?","correct_answer":"4","incorrect_answers":["8","2","6"]},
      {"category":"Animals","type":"multiple","difficulty":"hard","question":"What is the Gray Wolf&#039;s scientific name?","correct_answer":"Canis Lupus","incorrect_answers":["Canis Aureus","Canis Latrans","Canis Lupus Lycaon"]},
      {"category":"Animals","type":"multiple","difficulty":"medium","question":"Which of these species is not extinct?","correct_answer":"Komodo dragon","incorrect_answers":["Japanese sea lion","Tasmanian tiger","Saudi gazelle"]},
      {"category":"Animals","type":"multiple","difficulty":"easy","question":"Which class of animals are newts members of?","correct_answer":"Amphibian","incorrect_answers":["Fish","Reptiles","Mammals"]},
      {"category":"Animals","type":"multiple","difficulty":"medium","question":"What is the fastest animal?","correct_answer":"Peregrine Falcon","incorrect_answers":["Golden Eagle","Cheetah","Horsefly"]}
      ]
  }.to_json
end

