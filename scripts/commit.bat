@echo off
timeout /t 1 /nobreak

:: Đặt đường dẫn thư mục gốc
set "ROOT_DIR=C:\Users\Admin\Documents\GitHub"

@REM echo Bat dau xu ly cac Git repository...

for /D %%F in ("%ROOT_DIR%\*") do (
    :: Chỉ thực thi nếu folder chứa thư mục .git
    if exist "%%F\.git" (
        echo Đang xu ly: %%~nxF
        pushd "%%F"
        
        :: Chạy 1 lần (trừ khi bạn cố tình muốn chạy 2 lần)
        git nghia-git-commit-no-verify
        git nghia-git-commit-no-verify
        
        popd
    )
)

@REM echo Hoan thanh!