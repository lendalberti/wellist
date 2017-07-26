README

1. Set up MySQL
    * mysql -uroot -p       # log into MySQL as root; then execute the follwoing commands:

        * GRANT ALL PRIVILEGES ON wellist_development.* 
                                      TO 'wellist'@'localhost' IDENTIFIED BY 'wellist';
        * GRANT ALL PRIVILEGES ON wellist_production.* 
                                      TO 'wellist'@'localhost' IDENTIFIED BY 'wellist';
        * GRANT ALL PRIVILEGES ON wellist_test.* 
                                      TO 'wellist'@'localhost' IDENTIFIED BY 'wellist';


2. Clone wellist repository
  * unzip wellist2.zip
  * cd wellist2


3. Run rake files

    * rails db:create       # create  development, test, and production databases 
                            #       (see config/databases.yml)

    * rails db:migrate      # create tables 
                            #       (see db/shema.rb)

    * rails db:seed         # fill tables with some data

    * rails test            # run api controller test 
                            #      (see test/controllers/api_controller_test.rb)

    
4. Start rails server
    * rails s               # starts the server


5. Display database contents using browser
    * open 'http://localhost:3000'    


