# write data in libsvm format
# filename: an output file name
# y: a vector of labels, size n x 1
# x: a matrix or data frame of observations, size n x k

write.libsvm = function( filename, y, x ) {

	# open an output file
	f = file( filename, 'w' )

	# loop over examples
	for ( i in 1:nrow( x )) {

		# find indexes of nonzero values
		indexes = which( as.logical( x[i,] ))

		# those nonzero values
		values = x[i, indexes]
		
		# concatenate to the target format ( "1:6 3:77 6:8" )		
		iv_pairs = paste( indexes, values, sep = ":", collapse = " " )
		
		# add label in the front and newline at the end
		output_line = paste( y[i], " ", iv_pairs, "\n", sep = "" )
		
		# write to file
		cat( output_line, file = f )
		
		# print progress
		if ( i %% 1000 == 0 ) {
			print( i )
		}
	}
	
	# close the connection
	close( f )
}
