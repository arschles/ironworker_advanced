require 'iron_worker_ng'

client = IronWorkerNG::Client.new

if ARGV[0] == "usage"
  puts "ruby run.rb $CODE_PACKAGE $NUM_TASKS $NUM_THREADS $CLUSTER $PRIORITY"
  puts "use 'default' for default cluster"
  exit
end

start = Time.now
name = !ARGV[0].nil? ? ARGV[0] : "default"
tasks = !ARGV[1].nil? ? ARGV[1].to_i : 5
threads = !ARGV[2].nil? ? ARGV[2].to_i : 1
cluster = !ARGV[3].nil? ? ARGV[3].to_s : "default"
priority = !ARGV[4].nil? ? ARGV[4].to_i : 0

sleep_param = 1

puts "\ntasks #{tasks}, threads #{threads}, cluster #{cluster}, priority #{priority}\n"


tt = []
threads.times.each do |i|
  puts "-------- starting thread #{i} --------"
  tt << Thread.new{
    tasks.times{|j|
      client.tasks.create(name, {thread: i, num: j, sleep: sleep_param}, {cluster: cluster, priority:priority})
    }
  }
end

tt.map(&:join)
tt.map{ |t| begin; t.join; nil; rescue Exception => e; e.inspect;end;}.compact

totes = Time.now - start
puts "started #{tasks*threads} tasks in #{totes} seconds for an average of #{((totes/tasks)*1000).round(1)}ms each"
