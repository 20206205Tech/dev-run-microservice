@echo off
timeout /t 1 /nobreak

:: Đặt đường dẫn thư mục gốc
set "ROOT_DIR=C:\Users\Admin\Documents\GitHub"

:: Lặp qua tất cả các thư mục con cấp 1 bên trong ROOT_DIR
for /D %%F in ("%ROOT_DIR%\*") do (
    @REM echo.
    @REM echo ========================================================
    echo Đang xu ly folder: %%F
    @REM echo ========================================================
    
    :: Di chuyển vào thư mục con
    pushd "%%F"
    
    :: Thực thi lệnh git của bạn
    git nghia-git-commit-no-verify
    git nghia-git-commit-no-verify
    
    :: Trở về lại thư mục gốc để tiếp tục vòng lặp an toàn
    popd
)

@REM echo.
@REM echo ========================================================
@REM echo Da xu ly xong tat ca cac folder!
@REM @REM pause