class Sponsor < ActiveRecord::Base
  multi_column_search :name, :address, :city, :state, :zip, :phone, :fax

end