require 'json'
require 'rest_client'

  class API
    attr_reader :username, :password
    def initialize(username, password)
      @username = username
      @password = password
      @@site = RestClient::Resource.new('https://api.appfog.com')
    end

    def auth
      password = {'password'=>@password}.to_json
      request = @@site["users/#{@username}/tokens"].post password, :content_type => :json
      raw_token = JSON.parse(request)
      @token = raw_token['token']
    end
    
    def get(url)
      if @token == nil 
        auth
      end
      @@site[url].get("Authorization"=>@token)
    end  
    
    def post(url)
      if @token == nil 
        auth
      end
      @@site[url].post("Authorization"=>@token)
    end 

    def info
      JSON.parse(get("/info"))
    end

    def app(app)
      JSON.parse(get("/apps/#{app}"))
    end

    def app_crash(app)
      JSON.parse(get("/apps/#{app}/crashes"))
    end

    def app_instances(app)
      JSON.parse(get("/apps/#{app}/instances"))
    end

    def app_stats(app)
      JSON.parse(get("/apps/#{app}/stats"))
    end

    def services
      JSON.parse(get("/services"))
    end    
  end

