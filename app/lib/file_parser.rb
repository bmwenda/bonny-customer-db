class FileParser
  PARSERS = %w[Parsers::CSVParser Parsers::ExcelParser].freeze
  def self.parse
    file_data = []
    PARSERS.each do |parser|
      file_data << parser.constantize.new.parse
    end
    file_data.flatten
  end
end
