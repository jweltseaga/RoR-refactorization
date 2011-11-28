class Machine < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :required
    permalink   :string, :required
    description :html
    height      :integer
    width       :integer
    depth       :integer
    published   :boolean, :default => 'false'
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
 :path => ":rails_root/public/assets/images/:style_:basename.:extension",
 :url  => "/assets/images/:style_:basename.:extension"

	translates :name, :description
	
	has_many :categories, :through => :machine_assignments, :accessible => true
	has_many :machine_assignments, :dependent => :destroy
	
	has_many :features, :accessible => true
	
	has_many :manuals, :through => :manual_assignments, :accessible => true
	has_many :manual_assignments, :dependent => :destroy, :order => :position

  has_many :brochures, :through => :brochure_assignments, :accessible => true
  has_many :brochure_assignments, :dependent => :destroy, :order => :position
	
	children :features, :manual_assignments
	never_show :feature_translations

  def to_param
   permalink
  end

    def preview
      if description?
				description.split.slice(0, 15).join(" ")+"..."
			else
				"..."
			end
    end

    def currentManual
      this.manuals.limit(1) 
    end

    def currentBrochure
      this.brochures.limit(1)
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
