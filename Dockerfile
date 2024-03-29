FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY ./app /app
COPY ./entrypoint.sh /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix do compile

CMD ["/app/entrypoint.sh"]