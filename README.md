AF API wrapper
--------------

This is a very simple wrapper for AppFog's API. It was written with the intent 
of getting started with AppFog's Cloud Foundry API quickly and easily. This API
wrapper will help users who want to watch their af apps and not have to interact
with the CLI tool directly or indirectly.

Usage
-----

Basics: 

    require 'appfog_api'
    username = "johndoe@foobar.com"
    password = "foobar"
    api = API.new(username, password)
    api.info

The above will return basic information about available runtimes and user stats for johndoe@foobar.com.




Some available commands
-----------------------

Beyond `api.info` there are a number of additional available commands:

    api.services
    api.app(appname)
    api.app_crash(appname)
    api.app_instances(appname)
    api.app_stats(appname)

The above give more detailed information about applications and theie states in AppFog.


