set terminal png size 1000, 600
set output "ansible-docs.png"
set xdata time
set timefmt "%Y-%m-%dT%H:%M:%S+10:00"
set xtics format "%b %Y"
# 30 days is approx 2.6M seconds
set xtics "2014-09-31T00:00:00+10:00", 78E5, "2016-06-31T00:00:00+10:00"
set xrange ["2014-09-31T00:00:00+10:00":"2016-06-31T00:00:00+10:00"]
set yrange [0:1100]
plot 'ansible-docs.dat' using 1:3 title "Lines of standards documentation over time" with linespoints, \
                     '' using 1:($3+(int($2*10)%2 ? 20 : -30)):2 with labels notitle font ",11"
