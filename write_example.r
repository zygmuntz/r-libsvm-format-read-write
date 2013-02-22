# source( 'write_example.r' )

source( 'f_write.libsvm.r' )

input_file = 'data/example.csv'
output_file = 'data/example.libsvm.txt'
label_index = 1

###

d = read.csv( input_file, header = F )

y = d[, label_index]
x = d[, -label_index]

write.libsvm( output_file, y, x )
