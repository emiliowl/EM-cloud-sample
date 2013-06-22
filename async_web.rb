require 'rubygems'
require 'sinatra'

  # Request runs on the reactor thread (with threaded set to false)
  get '/hello' do
    'Hello World'
  end

  # Request runs on the reactor thread (with threaded set to false)
  # and returns immediately. The deferred task does not delay the
  # response from the web-service.
  get '/delayed-hello' do 
      beginn = Time.now
      puts "I'll execute a very heavy task here!"
      i = 2
      j = 2
      while (i < 99999999999999999)
       i += i
       while (j < 99999999)
         j += i
       end
      end 
      puts "OK. Task is done!"          
      endd = Time.now
      "Request received at: #{beginn}. Response send at: #{endd}. Time elapsed: #{(endd-beginn).to_s} seconds"
  end