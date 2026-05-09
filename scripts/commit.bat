@echo off
timeout /t 3 /nobreak

:: Đặt đường dẫn thư mục gốc
set "ROOT_DIR=C:\Users\Admin\Documents\GitHub"

:: Lặp qua tất cả các thư mục con cấp 1 bên trong ROOT_DIR
for /D %%F in ("%ROOT_DIR%\*") do (
    echo.
    echo ========================================================
    echo Đang xu ly folder: %%F
    echo ========================================================
    
    :: Di chuyển vào thư mục con
    pushd "%%F"
    
    :: Thực thi lệnh git của bạn
    git nghia-git-commit-no-verify
    git nghia-git-commit-no-verify
    
    :: Trở về lại thư mục gốc để tiếp tục vòng lặp an toàn
    popd
)

echo.
echo ========================================================
echo Da xu ly xong tat ca cac folder!
pause