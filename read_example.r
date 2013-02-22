# source( 'read_example.r' )

source( 'f_read.libsvm.r' )

input_file = 'data/example.libsvm.txt'
dimensionality = 7

###

d = read.libsvm( input_file, dimensionality )

y = d[, 1]
x = d[, -1]

print( y )
print( x )

