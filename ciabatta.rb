
# add your column names to the columns array in the order your CSV data is arranged in
columns = ["Location", "owls_per_square_foot","owl_rating","comments"]
num_columns = columns.length
current_column = 0

# fname is the name of the file this script outputs
fname = "owl_data.json"
jsonfile = File.open(fname, "w")

# the name of the main JSON object this script spits out == DATA
jsonfile.print "DATA = { "

# iterate through each character in the csv file and conver it to JSON accordingly
contents = File.open("data.csv", "r"){ 
	|file| file.read.split("").each do |i| 
		if i == "," then
			if current_column == 0 then
				jsonfile.puts ": { "
			else
				jsonfile.puts i
			end
			jsonfile.print "\t#{columns[current_column]}: "
			current_column += 1
		elsif i == "\n" then
			current_column = 0
			jsonfile.puts "\n},"
			jsonfile.print i
		else 
			jsonfile.print i
		end
	end
}

jsonfile.puts "}\n}"
jsonfile.close	

puts "SUCCESS"
# CIAO