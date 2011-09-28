class Machine < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :html
    height      :integer
    width       :integer
    depth       :integer
    weight      :integer
    timestamps
  end
	
	translates :name, :description
	
	has_many :categories, :through => :machine_assignments, :accessible => true
	has_many :machine_assignments, :dependent => :destroy
	
	has_many :features, :accessible => true
	
	has_many :manuals, :through => :manual_assignments, :accessible => true
	has_many :manual_assignments, :dependent => :destroy, :order => :position
	
	children :features, :manual_assignments
	never_show :feature_translations

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
