# frozen_string_literal: true
require 'migration_command_assistant/version'
require 'active_support'
require 'active_support/core_ext'

# migration command assistant
module MigrationCommandAssistant
  ADD_COLUMN    = '1'.freeze
  REMOVE_COLUMN = '2'.freeze
  DROP_TABLE    = '3'.freeze
  QUIT = 'q'.freeze
  def self.main
    puts 'what you want?'
    loop do
      puts "[#{ADD_COLUMN}] add column " \
        "[#{REMOVE_COLUMN}] remove column " \
        "[#{DROP_TABLE}] drop table " \
        "[#{QUIT}] quit"
      case gets.chomp
      when ADD_COLUMN
        add_column
        exit 0
      when REMOVE_COLUMN
        remove_column
        exit 0
      when DROP_TABLE
        drop_table
        exit 0
      when QUIT
        exit 0
      end
    end
  end

  def self.drop_table
    puts 'table name?'
    table_name = gets.chomp
    put_line
    puts 'rails generate migration ' \
      "Drop#{table_name.classify}"
    put_line
  end

  def self.add_column
    puts 'table name?'
    table_name = gets.chomp
    puts 'column name?'
    column_name = gets.chomp
    puts 'column type?(string text integer float decimal ' \
      'datetime timestamp time date binary boolean)'
    column_type = gets.chomp

    put_line
    puts 'rails generate migration ' \
      "Add#{column_name.classify}To#{table_name.classify} " \
      "#{column_name}:#{column_type}"
    put_line
  end

  def self.remove_column
    puts 'table name?'
    table_name = gets.chomp
    puts 'column name?'
    column_name = gets.chomp
    puts 'column type?(string text integer float decimal ' \
      'datetime timestamp time date binary boolean)'
    column_type = gets.chomp
    put_line
    puts 'rails generate migration ' \
      "Removel#{column_name.classify}From#{table_name.classify} " \
      "#{column_name}:#{column_type}"
    put_line
  end

  def self.put_line
    puts '=' * 100
  end
end
