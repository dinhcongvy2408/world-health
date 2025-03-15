# Tạo báo cáo tự động
rmd_content <- '
---
title: "Phân tích Dữ liệu Sức Khỏe Thế Giới"
author: "Tự động tạo"
date: "`r Sys.Date()`"
output: 
  html_document:
    theme: cosmo
    toc: true
    toc_float: true
---

## Tổng quan về dữ liệu

Báo cáo này phân tích các chỉ số sức khỏe quan trọng trên phạm vi toàn cầu, bao gồm:

1. Chỉ số về tuổi thọ và tử vong:
   - Tuổi thọ trung bình
   - Tỷ lệ tử vong ở trẻ em dưới 5 tuổi
   - Tỷ lệ tử vong do bệnh không lây nhiễm

2. Chỉ số về hệ thống y tế:
   - Số giường bệnh viện trên 1000 dân
   - Chi tiêu y tế bình quân đầu người
   - Tỷ lệ tiêm chủng DPT

3. Chỉ số về điều kiện môi trường:
   - Tiếp cận nước sạch
   - Tỷ lệ tử vong do ô nhiễm không khí

## Thống kê mô tả

```{r, echo=FALSE}
health_stats <- summary_stats %>%
  filter(Indicator.Name %in% selected_health_indicators)
knitr::kable(health_stats)
```

## Xu hướng các chỉ số sức khỏe theo thời gian

```{r, echo=FALSE, fig.width=12, fig.height=10}
trend_plot_health
```

### Giải thích xu hướng

1. **Tuổi thọ trung bình**: Chỉ số này cho thấy số năm trung bình mà một người có thể sống được. Xu hướng tăng trong chỉ số này phản ánh sự cải thiện về điều kiện sống và chăm sóc sức khỏe.

2. **Tỷ lệ tử vong trẻ em**: Số trẻ em tử vong trước 5 tuổi trên 1000 trẻ sinh ra sống. Chỉ số này giảm phản ánh sự tiến bộ trong chăm sóc sức khỏe bà mẹ và trẻ em.

3. **Cơ sở hạ tầng y tế**: Số giường bệnh viện trên 1000 dân phản ánh khả năng tiếp cận dịch vụ y tế của người dân.

4. **Chi tiêu y tế**: Chi tiêu y tế bình quân đầu người cho thấy mức đầu tư vào hệ thống y tế.

5. **Tiêm chủng**: Tỷ lệ tiêm chủng DPT phản ánh khả năng tiếp cận vaccine và phòng ngừa bệnh tật.

6. **Điều kiện môi trường**: Tiếp cận nước sạch và tỷ lệ tử vong do ô nhiễm không khí là các chỉ số quan trọng về điều kiện môi trường ảnh hưởng đến sức khỏe.

## Phân tích tương quan

```{r, echo=FALSE, fig.width=12, fig.height=10}
corrplot(cor_matrix, 
         method = "color",
         type = "upper",
         tl.col = "black",
         tl.srt = 45,
         tl.cex = 0.7,
         addCoef.col = "black",
         number.cex = 0.5,
         title = "Ma trận tương quan giữa các chỉ số sức khỏe")
```

### Nhận xét về mối tương quan

- Các chỉ số tích cực (như tuổi thọ, tiếp cận nước sạch) thường có tương quan thuận chiều với nhau
- Các chỉ số tiêu cực (như tỷ lệ tử vong) có tương quan nghịch chiều với các chỉ số tích cực
- Chi tiêu y tế có tương quan thuận chiều với tuổi thọ và tương quan nghịch chiều với tỷ lệ tử vong
'

# Lưu file R Markdown
writeLines(rmd_content, "output/reports/report.Rmd")

# Render báo cáo
rmarkdown::render("output/reports/report.Rmd", 
                 output_file = "world_data_analysis.html",
                 output_dir = "output/reports")

cat("Đã tạo báo cáo thành công!\n") 