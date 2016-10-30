require 'library'
require 'book'

RSpec.describe Library do
  before(:example) do
    @library = Library.new
  end

  it 'is initially empty' do
    expect(@library).to be_empty
  end

  it '#size returns the number of books in @library' do
    # create a test double and declares a method stub in one statement
    @library << instance_double('Book', :rspec_book)
    @library << instance_double('Book', '(Untitled)')

    expect(@library.size).to eq(2)
  end

  describe 'Facts about books in my Library' do
    it 'RSpec book has 250 pages' do
      # book = Book.new('The RSpec Book', 250)
      book = instance_double('Book', :rspec_book, pages: 250)
      expect(book.pages).to eq(250)
    end

    it 'RSpec book title is "The RSpec Book"' do
      # book = Book.new('The RSpec Book', 250)
      # book = double('book')
      book = double('book', title: 'The RSpec Book')

      # argument matchers
      expect(book).to receive(:title).with(no_args).twice

      expect(book.title).to be_truthy
      expect(book.title).to eq('The RSpec Book')
    end
  end
end
