xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"

xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" do

 xml.url do
	  @machines.each do |machine|
	   
		   xml.loc        machine_show_path(machine)
		   xml.lastmod    machine.updated_at
		   xml.changefreq "monthly"
		   xml.priority	  "0.05"

	  end
	  @categories.each do |category|

	  	  xml.loc        url_for(:only_path => false, :controller => 'machines', :action => 'show', :id => machine.id)
		  xml.lastmod    machine.updated_at
		  xml.changefreq "monthly"
		  xml.priority	  "0.05"

	  end
	end
end