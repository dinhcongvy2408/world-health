# Thiết lập môi trường
# Tạo các thư mục cần thiết
dir.create("output", showWarnings = FALSE)
dir.create("output/plots", showWarnings = FALSE)
dir.create("output/data", showWarnings = FALSE)
dir.create("output/reports", showWarnings = FALSE)

# Danh sách packages cần thiết
required_packages <- c(
  "tidyverse", "ggplot2", "corrplot", "scales", "data.table",
  "plotly", "DT", "knitr", "rmarkdown", "viridis"
)

# Cài đặt và load packages
install_and_load_packages <- function(packages) {
  for (package in packages) {
    if (!require(package, character.only = TRUE)) {
      cat(sprintf("Đang cài đặt package %s...\n", package))
      install.packages(package)
      library(package, character.only = TRUE)
    }
  }
  cat("Đã cài đặt và load tất cả packages cần thiết!\n")
}

install_and_load_packages(required_packages) 