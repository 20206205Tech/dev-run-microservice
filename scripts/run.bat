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



@REM :: 7. Mở giao diện trên trình duyệt mặc định
@REM start http://localhost:3000


echo Dang kiem tra trang thai cac service...

:: 1. Chờ Payment Service (33001)
echo - Dang cho Payment Service...
:wait_payment
curl -s http://localhost:33001/code-payment-service/docs >nul
if errorlevel 1 (
    timeout /t 2 /nobreak >nul
    goto wait_payment
)
echo   =^> Payment Service OK!

:: 2. Chờ Conversation Service (33002)
echo - Dang cho Conversation Service...
:wait_conversation
curl -s http://localhost:33002/code-conversation-service/docs >nul
if errorlevel 1 (
    timeout /t 2 /nobreak >nul
    goto wait_conversation
)
echo   =^> Conversation Service OK!

:: 3. Chờ Chatbot Service (52001)
echo - Dang cho Chatbot Service...
:wait_chatbot
curl -s http://localhost:52001/code-chatbot-service/docs >nul
if errorlevel 1 (
    timeout /t 2 /nobreak >nul
    goto wait_chatbot
)
echo   =^> Chatbot Service OK!

:: 4. Chờ Document Service (52002)
echo - Dang cho Document Service...
:wait_document
curl -s http://localhost:52002/code-document-service/docs >nul
if errorlevel 1 (
    timeout /t 2 /nobreak >nul
    goto wait_document
)
echo   =^> Document Service OK!

:: Khi đến được dòng này, nghĩa là CẢ 4 service đều đã chạy
echo.
echo Tat ca service da khoi dong xong! Tien hanh mo giao dien Frontend...

:: Chỉ mở 1 URL duy nhất
start http://localhost:3000