# Đọc và xử lý dữ liệu
# Đường dẫn file
main_data_path <- "API_8_DS2_en_csv_v2_3654.csv"
indicators_meta_path <- "Metadata_Indicator_API_8_DS2_en_csv_v2_3654.csv"
countries_meta_path <- "Metadata_Country_API_8_DS2_en_csv_v2_3654.csv"

# Đọc dữ liệu
main_data <- read_and_validate_data(main_data_path, skip_rows = 4)
indicators_meta <- read_and_validate_data(indicators_meta_path)
countries_meta <- read_and_validate_data(countries_meta_path)

# Chuyển đổi dữ liệu sang format dài
long_data <- main_data %>%
  gather(key = "Year", value = "Value", starts_with("X")) %>%
  mutate(
    Year = as.numeric(gsub("X", "", Year)),
    Value = as.numeric(Value)
  ) %>%
  filter(!is.na(Value))

cat("Đã chuyển đổi dữ liệu sang format dài thành công!\n") 