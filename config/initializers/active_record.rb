module ActiveRecord
  module ConnectionAdapters
    class Column
      def self.string_to_date_with_european_format(string)
        begin
          Date.strptime(string, '%d.%m.%Y')
        rescue
          string_to_date_without_european_format(string)
        end
      end
      def self.string_to_time_with_european_format(string)
        begin
          DateTime.strptime(string, '%d.%m.%Y %H:%M')
        rescue
          string_to_time_without_european_format(string)
        end
      end
      class << self
        alias_method_chain :string_to_date, :european_format
        alias_method_chain :string_to_time, :european_format
      end
    end
  end
end