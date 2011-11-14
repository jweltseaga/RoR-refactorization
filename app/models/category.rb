class Category < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
		description	:text
    permalink   :string
    timestamps
  end
	
	belongs_to :site
	acts_as_list :scope => :site 
	has_many :machines, :through => :machine_assignments, :accessible => true
	has_many :machine_assignments, :dependent => :destroy, :order => :position
	children :machine_assignments
	
  def to_param
   name
  end
	


  def localize
    self.join(:site).where("sites.name = {I18n.locale}")
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
