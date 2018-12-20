def three_digitizer(index)
  add_len = 3 - (index + 1).to_s.length
  return ("0") * add_len + (index + 1).to_s
end
