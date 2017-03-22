class String
	public
	def red() _(31) end
	def green() _(32) end
	def yellow() _(33) end
	def blue() _(34) end
	def lightblue() _(36) end
	def pink() _(35) end

	private
	def _(_) "\e[#{_}m#{self}\e[0m" end
end
