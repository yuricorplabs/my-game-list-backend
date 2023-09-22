# frozen_string_literal: true

# From devise-jwt documentation:
# from devise-jwt documentation:

# Here, the model class acts as the revocation strategy.
# It needs a new string column named JTI to be added to the user.
# JTI stands for JWT ID, and it is a standard claim meant to uniquely identify a token.

# It works like the following:

# When a token is dispatched for a user, the JTI claim is taken from the
# JTI column in the model (which has been initialized when the record has been created).

# At every authenticated action, the incoming token JTI claim is matched against the
# JTI column for that user. The authentication only succeeds if they are the same.

# When the user requests to sign out its JTI column changes, so that provided token won't be valid anymore.
class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string, null: false, default: -> { 'md5(random()::text)' }
    add_index :users, :jti, unique: true
  end
end
