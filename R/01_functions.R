# Định nghĩa các hàm tiện ích
read_and_validate_data <- function(file_path, skip_rows = 0) {
  if (!file.exists(file_path)) {
    stop(sprintf("File không tồn tại: %s", file_path))
  }
  
  cat(sprintf("Đang đọc file: %s\n", basename(file_path)))
  data <- read.csv(file_path, skip = skip_rows)
  
  missing_data <- colSums(is.na(data))
  if (any(missing_data > 0)) {
    warning(sprintf("Có dữ liệu trống trong các cột: %s", 
                   paste(names(missing_data[missing_data > 0]), collapse = ", ")))
  }
  
  cat(sprintf("Đã đọc thành công file với %d dòng và %d cột\n", 
              nrow(data), ncol(data)))
  return(data)
}

handle_outliers <- function(data, column, threshold = 3) {
  if (!column %in% colnames(data)) {
    stop(sprintf("Không tìm thấy cột: %s", column))
  }
  
  z_scores <- abs(scale(data[[column]]))
  outlier_count <- sum(z_scores > threshold, na.rm = TRUE)
  
  if (outlier_count > 0) {
    cat(sprintf("Đã tìm thấy %d outliers trong cột %s\n", outlier_count, column))
    data[[column]][z_scores > threshold] <- NA
  }
  
  return(data)
} 