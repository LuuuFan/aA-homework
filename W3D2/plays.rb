require 'sqlite3'
require 'singleton'
require 'byebug'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id, :playwright_name

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays JOIN playwrights ON playwright_id = playwrights.id")
    # debugger
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    # puts "SELECT * FROM plays WHERE title = '#{title}'"
    # data = PlayDBConnection.instance.execute("SELECT * FROM plays WHERE title = '#{title}'")
    # debugger
    # raise "#{title} doesn't exist" if data.empty?
    # Play.new(data)
    result = Play.all.find { |play| play.title == title }
    result.nil? ? "Cannot find #{title}" : result
  end

  def self.find_by_playwright(name)
    result = Play.all.find { |play| play.playwright_name == name }
    result.nil? ? "Cannot find song from #{name}" : result
  end


  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
    @playwright_name = options['name']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    # debugger
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    result = Playwright.all.find { |playwright| playwright.name == name }
    result.nil? ? "Cannot find #{name}" : result
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    Play.find_by_playwright(@name)
  end
end
