# Use the official Ruby image as the base image
FROM ruby:3.2.0

# Set the working directory in the container
WORKDIR /docker/app
# Install Node.js and Yarn (needed for Rails 7)
RUN apt-get update -qq && apt-get install -y nodejs yarn build-essential apt-utils libpq-dev
# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle update --bundler
RUN bundle install
ADD . /docker/app
RUN bundle exec rake app:update:bin
# Copy the rest of the application code to the container
#COPY . .

# Expose port 3000 for the Rails application
ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

# Start the Rails application
CMD [ "rails", "server", "-b", "0.0.0.0"]