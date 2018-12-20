def make_prod_num
  t_one = Time.now
  temp = (digi_check(t_one.year) +
          digi_check(t_one.month) +
          digi_check(t_one.day) +
          digi_check(t_one.hour) +
          digi_check(t_one.min) +
          digi_check(t_one.sec) +
          rand(100..999).to_s).scan(/.{1,3}/m).join("-")
end

def digi_check(int)
  int.to_s.length == 1 ? "0" + int.to_s : int.to_s[-2..-1]
end
