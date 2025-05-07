#!/bin/bash

# Lấy ngày hiện tại theo định dạng YYYY-MM-DD
TODAY=$(date +"%Y-%m-%d")
FOLDER="logs"
FILENAME="$FOLDER/$TODAY.md"

# Tạo thư mục nếu chưa có
mkdir -p $FOLDER

# Kiểm tra nếu file đã tồn tại
if [ -f "$FILENAME" ]; then
  echo "⚠️  File log $FILENAME đã tồn tại!"
else
  # Tạo file log mới với template cơ bản
  echo "# Log ngày $TODAY

## ✅ Hôm nay đã làm gì?
- 

## 🤔 Ghi chú
- 

## 📘 Học được gì từ GitHub?
- 
" > $FILENAME

  echo "📄 File log mới đã được tạo: $FILENAME"
fi

# Thêm vào git
git add $FILENAME

# Commit với message chuẩn
git commit -m "docs: log ngày $TODAY"

# Push lên GitHub
git push

echo "✅ Đã commit & push log ngày $TODAY lên GitHub!"