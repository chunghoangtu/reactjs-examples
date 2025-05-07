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
  echo "# Ngày 2 - Làm việc với branch

## ✅ Hôm nay đã làm gì?
- Tạo branch mới `log-2025-05-07`.
- Chỉnh sửa nội dung trang chính `App.jsx`.
- Commit + Push + Pull Request.
- Merge PR thành công về nhánh `main`.

## 🤔 Ghi chú
- Tạo branch giúp tránh làm hỏng code chính.
- Merge về `main` chỉ khi đã test ổn.

## 📘 Học được gì từ GitHub?
- Quy trình làm việc nhóm chuyên nghiệp luôn gắn với branch + PR.
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