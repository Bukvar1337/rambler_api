module Sorter
  class Main
    SORTABLE_METHODS = %w(ASC DESC)
    def initialize(sort, sortable_columns)
      @sort = sort
      @sortable_columns = sortable_columns
      @query = ""
    end

    def call
      return sort_string if @sort.class.to_s == "String"
      return sort_array if @sort.class.to_s == "Array"
    end

    def sort_array
      @sort.each do |q|
        a = q.split(' ')
        @query += "#{a[0]} #{a[1]}," if check(a[0], a[1])
      end
      @query.chomp(',')
    end

    def sort_string
      a = @sort.split(' ')
      @sort if check(a[0], a[1])
    end

    def check(column, method)
      return true if @sortable_columns.include?(column) && SORTABLE_METHODS.include?(method)
      false
    end
  end
end
