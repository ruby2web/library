class IsbnValidator < ActiveModel::Validator
  VALID_CHARACTERS = ['0', '1', '2', '3', '4', '5',
                      '6', '7', '8', '9', '0', 'x']
  
  attr_reader :isbn

  # This is a comment
  def initialize(options = {})
    super(options)
  end

  # v = IsbnValidator.new
  # v.validate("IKJLFKDJFKLD")
  
  def validate(record)
    if record.is_a?(String)
      return valid?(record)
    else
      record.errors[:isbn] << "is not a valid ISBN" unless valid?(record.isbn)
    end
  end
  
  def valid?(isbn)
    isbn = cleanup_isbn(isbn)
    if isbn.size == 10 || isbn.size == 13
      isbn.chars.all? { |c| valid_character?(c) }
    else
      return false
    end
  end
  
  private
  
  def valid_character?(c)
    return VALID_CHARACTERS.include?(c)
  end
  
  def cleanup_isbn(isbn)
    isbn = "" if isbn.nil?
    isbn.downcase.gsub(/-| /, "")
  end  
  
end