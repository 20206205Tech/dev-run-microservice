@echo off
timeout /t 1 /nobreak

:: Đặt đường dẫn thư mục gốc
set "ROOT_DIR=C:\Users\Admin\Documents\GitHub"

@REM echo Bat dau xu ly cac Git repository...

for /D %%F in ("%ROOT_DIR%\*") do (
    :: Chỉ thực thi nếu folder chứa thư mục .git
    if exist "%%F\.git" (

        @REM echo Đang xu ly: %%~nxF

        pushd "%%F"
        

        git nghia-reset-count 
        
        popd
    )
)

@REM echo Hoan thanh!