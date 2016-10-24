# Generating the data

Track each increment of the version bump. Date, version, and lines of docs:

```
cd /path/to/ansible-docs
for c in $(git log --reverse --pretty=format:%H VERSION)
do
  echo $(git log --format=%aI -n1 $c) \ 
       $(git show $c:VERSION) \
       $(git diff --shortstat `git hash-object -t tree /dev/null` $c | awk -F, '{print $2}' | awk '{print $1}');
done > ~/src/ansible-docs.dat
```

# Generate the graph

```
gnuplot ansible-docs.gnuplot
```

# See the graph

```
display ansible-docs.png
```
