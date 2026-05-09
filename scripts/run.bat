@echo off

@REM echo Microservice

echo " /$$      /$$ /$$                                                                        /$$                    "
echo "| $$$    /$$$|__/                                                                       |__/                    "
echo "| $$$$  /$$$$ /$$  /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$  /$$    /$$ /$$  /$$$$$$$  /$$$$$$ "
echo "| $$ $$/$$ $$| $$ /$$_____/ /$$__  $$ /$$__  $$ /$$_____/ /$$__  $$ /$$__  $$|  $$  /$$/| $$ /$$_____/ /$$__  $$"
echo "| $$  $$$| $$| $$| $$      | $$  \__/| $$  \ $$|  $$$$$$ | $$$$$$$$| $$  \__/ \  $$/$$/ | $$| $$      | $$$$$$$$"
echo "| $$\  $ | $$| $$| $$      | $$      | $$  | $$ \____  $$| $$_____/| $$        \  $$$/  | $$| $$      | $$_____/"
echo "| $$ \/  | $$| $$|  $$$$$$$| $$      |  $$$$$$/ /$$$$$$$/|  $$$$$$$| $$         \  $/   | $$|  $$$$$$$|  $$$$$$$"
echo "|__/     |__/|__/ \_______/|__/       \______/ |_______/  \_______/|__/          \_/    |__/ \_______/ \_______/"



timeout /t 6 /nobreak
@REM timeout /t 60 /nobreak
@REM timeout /t 30 /nobreak

@REM choice /c YN /m "Start All Microservice"

@REM :: Nếu người dùng bấm N (No), thoát file .bat
@REM if errorlevel 2 (
@REM     @REM echo.
@REM     @REM echo Da huy khoi dong he thong.
@REM     @REM pause
@REM     exit
@REM )

@REM :: Nếu người dùng bấm Y (Yes), tiếp tục chạy xuống dưới
@REM echo.
@REM echo Dang bat dau khoi dong cac services...


:: 3. Khởi động code-conversation-service
cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "Conversation Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"

:: 4. Khởi động code-payment-service
cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service"
start "Payment Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"

:: 5. Khởi động Frontend UI (Không dùng Doppler)
cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start "Frontend UI" "C:\Program Files\Git\bin\bash.exe" --login -i -c "npm run start:dev; exec bash"


:: 1. Khởi động code-chatbot-service
cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "Chatbot Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"

:: 1. Khởi động code-chatbot-service
cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "Chatbot Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python voice_worker.py dev; exec bash"

:: 2. Khởi động code-document-service
cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
start "Document Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"



:: 7. Mở giao diện trên trình duyệt mặc định
start http://localhost:3000
