@echo off



if not "%1" == "max" start /MAX cmd /c %0 max & exit/b





echo " /$$      /$$ /$$                                                                        /$$                    "
echo "| $$$    /$$$|__/                                                                       |__/                    "
echo "| $$$$  /$$$$ /$$  /$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$  /$$    /$$ /$$  /$$$$$$$  /$$$$$$ "
echo "| $$ $$/$$ $$| $$ /$$_____/ /$$__  $$ /$$__  $$ /$$_____/ /$$__  $$ /$$__  $$|  $$  /$$/| $$ /$$_____/ /$$__  $$"
echo "| $$  $$$| $$| $$| $$      | $$  \__/| $$  \ $$|  $$$$$$ | $$$$$$$$| $$  \__/ \  $$/$$/ | $$| $$      | $$$$$$$$"
echo "| $$\  $ | $$| $$| $$      | $$      | $$  | $$ \____  $$| $$_____/| $$        \  $$$/  | $$| $$      | $$_____/"
echo "| $$ \/  | $$| $$|  $$$$$$$| $$      |  $$$$$$/ /$$$$$$$/|  $$$$$$$| $$         \  $/   | $$|  $$$$$$$|  $$$$$$$"
echo "|__/     |__/|__/ \_______/|__/       \______/ |_______/  \_______/|__/          \_/    |__/ \_______/ \_______/"



timeout /t 10 /nobreak









cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "Conversation Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"
timeout /t 10 /nobreak









cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "Chatbot Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
timeout /t 10 /nobreak






cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "Chatbot Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python voice_worker.py dev; exec bash"
timeout /t 10 /nobreak












cd /d "C:\Users\Admin\Documents\GitHub\code-persona-service"
start "persona Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
timeout /t 10 /nobreak





@REM cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service"
@REM start "Payment Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"
@REM timeout /t 10 /nobreak








@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-worker"
@REM start "code-document-worker" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run celery -A  worker.celery_app worker --pool=solo --loglevel=info; exec bash"
@REM timeout /t 10 /nobreak










@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
@REM start "Document Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
@REM timeout /t 10 /nobreak












   
@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-phapdien-service"
@REM start "Document Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
@REM timeout /t 10 /nobreak









@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-vbplnew-service"
@REM start "Document Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
@REM timeout /t 10 /nobreak









@REM :wait_payment
@REM curl -s http://localhost:33001/code-payment-service/docs >nul
@REM if errorlevel 1 (
@REM     timeout /t 2 /nobreak >nul
@REM     goto wait_payment
@REM )



@REM :wait_conversation
@REM curl -s http://localhost:33002/code-conversation-service/docs >nul
@REM if errorlevel 1 (
@REM     timeout /t 2 /nobreak >nul
@REM     goto wait_conversation
@REM )




@REM :wait_chatbot
@REM curl -s http://localhost:52001/code-chatbot-service/docs >nul
@REM if errorlevel 1 (
@REM     timeout /t 2 /nobreak >nul
@REM     goto wait_chatbot
@REM )



@REM :wait_document
@REM curl -s http://localhost:52002/code-document-service/docs >nul
@REM if errorlevel 1 (
@REM     timeout /t 2 /nobreak >nul
@REM     goto wait_document
@REM )














cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start "Frontend UI" "C:\Program Files\Git\bin\bash.exe" --login -i -c "npm run start:dev; exec bash"
timeout /t 10 /nobreak



start http://localhost:3000
