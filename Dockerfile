FROM elixir:latest

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY ./app /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix do compile

# Bootstrap the Database
CMD ["/app/entrypoint.sh"]