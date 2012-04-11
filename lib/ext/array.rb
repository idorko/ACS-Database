class Array

	def sort_by_name
		self.sort! { |a,b| a.last_name.downcase <=> b.last_name.downcase }
	end

end
