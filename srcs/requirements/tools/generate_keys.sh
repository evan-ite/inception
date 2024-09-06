#!/bin/bash

# File path
ENV_FILE="/home/evan-ite/projects/inception/srcs/.env"

# Fetching keys from the WordPress API
KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)

clean_key() {
  echo "$1" | tr -d '\n' | xargs
}

# Extracting and cleaning keys
AUTH_KEY=$(clean_key "$(echo "$KEYS" | grep "AUTH_KEY" | cut -d "'" -f 4)")
SECURE_AUTH_KEY=$(clean_key "$(echo "$KEYS" | grep "SECURE_AUTH_KEY" | cut -d "'" -f 4)")
LOGGED_IN_KEY=$(clean_key "$(echo "$KEYS" | grep "LOGGED_IN_KEY" | cut -d "'" -f 4)")
NONCE_KEY=$(clean_key "$(echo "$KEYS" | grep "NONCE_KEY" | cut -d "'" -f 4)")
AUTH_SALT=$(clean_key "$(echo "$KEYS" | grep "AUTH_SALT" | cut -d "'" -f 4)")
SECURE_AUTH_SALT=$(clean_key "$(echo "$KEYS" | grep "SECURE_AUTH_SALT" | cut -d "'" -f 4)")
LOGGED_IN_SALT=$(clean_key "$(echo "$KEYS" | grep "LOGGED_IN_SALT" | cut -d "'" -f 4)")
NONCE_SALT=$(clean_key "$(echo "$KEYS" | grep "NONCE_SALT" | cut -d "'" -f 4)")


# Function to check if a key exists in the file
key_exists() {
  grep -q "^$1=" "$ENV_FILE"
}

# Function to append key to file if it doesn't exist
append_key_if_absent() {
  local key=$1
  local value=$2
  if ! key_exists "$key"; then
    echo "$key=\"$value\"" >> "$ENV_FILE"
  fi
}

# Append keys to the .env file if they are not already present
append_key_if_absent "AUTH_KEY" "$AUTH_KEY"
append_key_if_absent "SECURE_AUTH_KEY" "$SECURE_AUTH_KEY"
append_key_if_absent "LOGGED_IN_KEY" "$LOGGED_IN_KEY"
append_key_if_absent "NONCE_KEY" "$NONCE_KEY"
append_key_if_absent "AUTH_SALT" "$AUTH_SALT"
append_key_if_absent "SECURE_AUTH_SALT" "$SECURE_AUTH_SALT"
append_key_if_absent "LOGGED_IN_SALT" "$LOGGED_IN_SALT"
append_key_if_absent "NONCE_SALT" "$NONCE_SALT"

echo "Generated keys and appended to $ENV_FILE"