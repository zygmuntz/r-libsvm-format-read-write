# read data from a file in libsvm format
# filename: an input file name
# dimensionality: a number of columns, excluding label

# returns a matrix with a label in the first row

read.libsvm = function( filename, dimensionality ) {

	content = readLines( filename )
	num_lines = length( content )
	yx = matrix( 0, num_lines, dimensionality + 1 )

	# loop over lines
	for ( i in 1:num_lines ) {
	
		# split by spaces
		line = as.vector( strsplit( content[i], ' ' )[[1]])
	
		# save label
		yx[i,1] = as.numeric( line[[1]] )
	
		# loop over values
		for ( j in 2:length( line )) {
	
			# split by colon
			index_value = strsplit( line[j], ':' )[[1]]

			index = as.numeric( index_value[1] ) + 1		# +1 because label goes first
			value = as.numeric( index_value[2] )

			yx[i, index] = value
		}
	}
	
	return( yx )
}
