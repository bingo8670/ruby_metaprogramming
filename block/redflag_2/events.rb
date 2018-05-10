def monthly_sales
  110 # TODO: 从数据库中读取真实的数据
end

target_sales = 100

event "monthly_sales are suspiciously high" do
  monthly_sales > target_sales
end

event "monthly_sales are abysmally low" do
  monthly_sales < target_sales
end
