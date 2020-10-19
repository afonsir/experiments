# CREATE TABLE empsalaries(
#   department_id INTEGER,
#   employee_id   INTEGER,
#   salary        INTEGER
# );
#
# INSERT INTO empsalaries (
#   SELECT (1 + ROUND(RANDOM() * 25)), *, (50000 + ROUND(RANDOM() * 250000))
#   FROM generate_series(1, 10000)
# );
#
# CREATE INDEX empsalaries_department_id_idx ON empsalaries (department_id);
#
# SELECT department_id, employee_id, salary,
#   RANK() OVER(PARTITION BY department_id ORDER BY salary DESC)
# FROM empsalaries;
#
# Time: 19.191ms

require 'active_record'

ActiveRecord::Base.establish_connection('postgres://postgres:*****@localhost/company_data')

class Empsalary < ActiveRecord::Base
  attr_accessor :rank
end

time = Benchmark.realtime do
  salaries = Empsalary.all.order(:department_id, :salary)

  key = nil
  counter = nil

  salaries.each do |s|
    if s.department_id != key
      key = s.department_id
      counter = 0
    end
    counter += 1
    s.rank = counter
  end
end

puts "Group rank with ActiveRecord: %5.3fs" % time # 0.134s ou 134ms
