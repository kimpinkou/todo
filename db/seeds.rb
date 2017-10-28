
# User.users('dhh','dhh@rails.com','1976-10-13')
# User.users('matz','matz@rails.com','1955-11-14')

(1..20).each do |i|
  Task.create do |task|
    task.name     = "task #{i}"
    task.deadline = i.days.since
    task.status   = false
  end
end
