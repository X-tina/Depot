Order.transaction do |variable|
	(1..100).eacj do |i|
		Order.create(name: "Customer #{i}", address: "#{i} Main street",
		email: "customer-#{i}@example.com", pay_type: "check")
	end
end