require 'sequel'

DB = Sequel.sqlite

DB.create_table :builds do
  primary_key :id
  String :files
  String :results, :default => ''
  String :root
  String :project
  String :type
  String :server_type
  String :requester_mac
  Boolean :done, :default => false
end


DB.create_table :jobs do
  primary_key :id
  String :files
  String :result
  String :root
  String :project
  String :type
  String :server_type
  String :requester_mac
  Integer :build_id
  Integer :taken_by_id
  Datetime :taken_at, :default => nil
end

DB.create_table :runners do
  primary_key :id
  String :ip
  String :hostname
  String :mac
  String :username
  Integer :version
  Integer :idle_instances
  Integer :max_instances
  Datetime :last_seen_at
end

DB.create_table :runtimes do
  primary_key :id
  String :type
  String :path
  Integer :time
end