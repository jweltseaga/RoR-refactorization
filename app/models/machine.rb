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

  # Paperclip
	has_attached_file :photo,
  :styles => {
    :thumbnail => "100x100>",
    :medium => "200x200>",
    :large  => "300x300>",
    :original => "600x600>"
  }, 
 :path => ":rails_root/public/images/:class/:attachment/:id/:style_:basename.:extension",
 :url  => "/images/:class/:attachment/:id/:style_:basename.:extension"

	translates :name, :description
	
	has_many :categories, :through => :machine_assignments, :accessible => true
	has_many :machine_assignments, :dependent => :destroy
	
	has_many :features, :accessible => true
	
	has_many :manuals, :through => :manual_assignments, :accessible => true
	has_many :manual_assignments, :dependent => :destroy, :order => :position
	
	children :features, :manual_assignments
	never_show :feature_translations

def preview
  description.split.slice(0, 15).join(" ")+"..."
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
