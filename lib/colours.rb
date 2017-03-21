class String
	public
	def red() colours(31) end
	def green() colours(32) end
	def yellow() colours(33) end
	def blue() colours(34) end
	def lightblue() colours(36) end
	def pink() colours(35) end

	private
	def colours(_) "\e[#{_}m#{self}\e[0m" end
end