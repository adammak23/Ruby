# in lib/book.rb
class Book
  attr_accessor :title, :pages

  def initialize(title, pages)
    @title = title
    @pages = pages
  end
end
