# README

## Model size

In database:
```sql
select pg_size_pretty(pg_relation_size('things'));

pg_size_pretty 
----------------
 11 MB
(1 row)
```

With *Active Record* (almost **2.5** times bigger):
```ruby
Measure.run(gc: :disable) { Thing.all.load }
{"ruby_version":"2.5.5","gc":"disable","time":0.14,"gc_count":0,"memory":"26 MB"}
```

Loading only necessary columns:
```ruby
Measure.run { Thing.all.select(:id, :col1, :col5).load }
{"ruby_version":"2.5.5","gc":"enable","time":0.07,"gc_count":0,"memory":"0 MB"}

Measure.run { Thing.all.each { |thing| thing.minions.load } }
{"ruby_version":"2.5.5","gc":"enable","time":6.1,"gc_count":0,"memory":"596 MB"}

Measure.run { Thing.all.includes(:minions).load }
{"ruby_version":"2.5.5","gc":"enable","time":1.89,"gc_count":0,"memory":"0 MB"}

query = <<-SQL
  select id, col1, array_agg(mcol4) from things
  inner join
  (select thing_id, mcol4 from minions) minions
  on (things.id = minions.thing_id)
  group by id, col1
SQL

Measure.run { Thing.find_by_sql(query) }
{"ruby_version":"2.5.5","gc":"enable","time":0.23,"gc_count":0,"memory":"0 MB"}
```

## Objects in memory

```ruby
ObjectSpace.each_object(Thing).count
=> 0

Thing.find_in_batches do |batch|
  GC.start
  puts ObjectSpace.each_object(Thing).count
end
=> 2000 # for each batch


ObjectSpace.each_object(Thing).count
=> 0

Thing.all.each_with_index do |thing, i|
  if i % 1000 == 0
    GC.start
    puts ObjectSpace.each_object(Thing).count
  end
end
=> 10000 # for each batch
```
## Avoiding *Active Record* objects
```ruby
# returns unparsed values, but don't instantiate active record models
ActiveRecord::Base.connection.execute("select * from things")
ActiveRecord::Base.connection.select_values("select col5 from things")

# returns an array
Thing.all.pluck(:col1, :col5)

# skip before and after filters
Thing.where("id < 10").update_all(col1: 'something')
```