# DESCRIPITON


Huli-Selection.
This project based on the selection process of the Green Fox Academy. We create a Web application running on AWS for the applicants and admins to manage the CV files the video interviews and makes communications automated via mails.

- fill registration form
- upload picture
- upload CV
- fill DRT
- create video interview
- scheduled personal interview
- scheduled simulation
- accepted / rejected
- assigned to class These steps currently are administered in an google document. The application's goal is to fully replace that, so a person journey can be monitored throughout the selection process, all steps are visible and as automated as possible. The user - can check how many applicants are in the different steps and it also lists the necessary next actions.

# DEVELOPMENT SETUP
(Ruby on Rails on Ubuntu 17)


STEP 1: Install curl:
sudo apt-get install curl


STEP 2: Install Ruby 2.4.2:
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn


STEP 3: Using RVM:
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.2
rvm use 2.4.2 --default
ruby -v


STEP 4: Install Bundle:
gem install bundler


STEP 5: Installing Rails:
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
gem install rails -v 5.1.4


STEP 6: Setting Up MySQL:
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
raka db:create
rake db:migrate

RUN in the app dictionary:
rails server

Further information:
https://gorails.com/setup/ubuntu/17.10


# DEPLOY CODE TO A VIRTUAL MACHINE

STEP 1: SETUP EB CLI on Linux: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html

STEP 2: placing in the correct folder on your machine:	
	in the project folder type: eb init
	enter the given access key and secret key
	Select an application to use
	Select a platform which is in used
	Choose yes to assign an SSH key
	Choose an existing key pair

STEP 3: Deploy the Project:
	every local changes have to push
	run bundle install
	run eb deploy <enviroment> (enviroment is staging or production)
	eb deploy

Further informarion:
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_rails.html#ruby-rails-tutorial-deploy

