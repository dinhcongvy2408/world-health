# File chính để chạy toàn bộ phân tích

# Thiết lập working directory
setwd("D:/University/Hoc_DuLieuLon/BaiTapLon/Data Sources")

# Source các file
source("R/00_setup.R")
source("R/01_functions.R")
source("R/02_data_loading.R")
source("R/03_analysis.R")
source("R/04_visualization.R")
source("R/05_report.R")

cat("Phân tích dữ liệu hoàn tất!\n") 