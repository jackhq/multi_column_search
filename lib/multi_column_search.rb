require 'active_record'

module MultiColumnSearch
  # Adds a Model.search('term1 term2') method that searches across SEARCH_COLUMNS
  # for ORed across columns.
  #   
  #  class Company
  #    multi_column_search :name, :address, :city, :state, :zip, :phone
  #  end
  #  
  #  Company.search('Jack Russ')          # => any company, street, city that match Jack Russ
  #  Company.search('29464')          # => any company with zip code 29464
  #  Company.search('Mount P')  
  #    # => any company with 'Mount P' in the city
  def multi_column_search(*args)
    options = args.extract_options!
    columns = args

    options[:match] ||= :start
    options[:name] ||= 'search'

    # PostgreSQL LIKE is case-sensitive, use ILIKE for case-insensitive
    like = connection.adapter_name == "PostgreSQL" ? "ILIKE" : "LIKE"
    scope options[:name], lambda { |terms|
      terms = terms.split.join('%')
      conditions = terms.split.inject([]) do |acc, term|
        pattern = get_multi_column_pattern options[:match], term
        acc << columns.collect { |column| "#{table_name}.#{column} #{like} '#{pattern}'" }  
      
      end
      
      where conditions.map { |c| "(" + c.join(' OR ') + ")" }.join(' OR ')
      }     
  end
  
  def get_multi_column_pattern(match, term)
    case(match)
    when :exact
      term
    when :start
      term + '%'
    when :middle
      '%' + term + '%'
    when :end
      '%' + term
    else
      raise "Unexpected match type: #{options[:match]}"
    end    
  end
  
  
end
