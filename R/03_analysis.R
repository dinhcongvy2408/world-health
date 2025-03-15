# Phân tích dữ liệu
# Tính toán thống kê mô tả
summary_stats <- long_data %>%
  group_by(Indicator.Name) %>%
  summarise(
    n = n(),
    missing = sum(is.na(Value)),
    mean = mean(Value, na.rm = TRUE),
    median = median(Value, na.rm = TRUE),
    sd = sd(Value, na.rm = TRUE),
    min = min(Value, na.rm = TRUE),
    max = max(Value, na.rm = TRUE)
  ) %>%
  arrange(desc(n))

# Lưu kết quả thống kê
write.csv(summary_stats, "output/data/summary_statistics.csv", row.names = FALSE)

# Phân tích tương quan
recent_year <- max(long_data$Year)
correlation_data <- long_data %>%
  filter(Year == recent_year) %>%
  select(Country.Name, Indicator.Name, Value) %>%
  spread(key = Indicator.Name, value = Value)

numeric_cols <- sapply(correlation_data, is.numeric)
cor_matrix <- cor(correlation_data[, numeric_cols], use = "pairwise.complete.obs")

cat("Đã hoàn thành phân tích dữ liệu!\n") 