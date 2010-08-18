require File.join(File.dirname(__FILE__), 'spec_helper')

describe MultiColumnSearch do
  before(:each) do
    Sponsor.delete_all
    
    @jrs = Sponsor.create(:name => 'Jack Russell Software', :address => '1067 Cliffwood Drive', :city => 'Mount Pleasant', :state => 'SC', :zip => '29464', :phone => '843.628.0463', :fax => '843.388.9952')
    @wal = Sponsor.create(:name => 'Walmart Company', :address => '333 Sam Sneed Drive', :city => 'Mount Pleasant', :state => 'SC', :zip => '29464', :phone => '843-628-4321', :fax => '843.388.9952')
    @musc = Sponsor.create(:name => 'MUSC Health', :address => '1 Downtown Street', :city => 'Charleston', :state => 'SC', :zip => '29401', :phone => '843-555-0463', :fax => '843.388.9952')
    
    @sponsors = [@jrs, @wal, @musc]
  end

  describe "multi column search default match" do
     it "should find sponsors by zip" do
       Sponsor.search('2946').count.should == 2
     end

     it "should find sponsors by address" do
       Sponsor.search('333 Sam').count.should == 1
     end

     it "should find sponsors by city" do
       Sponsor.search('Mount P').count.should == 2
     end

  end
  
  
end
