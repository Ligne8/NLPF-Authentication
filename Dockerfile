# Use an Elixir image
FROM elixir:1.17.0

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Change the working directory
WORKDIR /app

# Copy Mix configuration files
COPY mix.exs mix.lock ./

# Install dependencies
RUN mix deps.get

# Copy the rest of the application
COPY . .

# Compile the application
RUN mix compile

# Expose the application port
EXPOSE 4000

# Start the application
CMD ["mix", "phx.server"]
