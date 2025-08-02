return function(config)
  local max = 0
  if #config.digits < config.span or config.span < 0 then error('Invalid') end
  for i = 1, #config.digits - config.span + 1 do
    local match, number = config.digits:sub(i, i + config.span - 1), 1
    for j = 1, #match do number = number * match:sub(j, j) end
    if number > max then max = number end
  end
  return max
end
