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



timeout /t 5 /nobreak
@REM cd /d "C:\Users\Admin\Documents\GitHub\dev-run-microservice"
@REM start "persona-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .          ; exec bash"

cd /d "C:\Users\Admin\Documents\GitHub\code-persona-service"
start "code-persona-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
:wait_persona
curl -s http://localhost:52003/code-persona-service/docs >nul
if errorlevel 1 (
 timeout /t 2 /nobreak >nul
 goto wait_persona
)








cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "code-conversation-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && npm i && doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"
:wait_conversation
curl -s http://localhost:33002/code-conversation-service/docs >nul
if errorlevel 1 (
 timeout /t 2 /nobreak >nul
 goto wait_conversation
)




cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service"
start "code-payment-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && npm i && doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"
:wait_payment
curl -s http://localhost:33001/code-payment-service/docs >nul
if errorlevel 1 (
 timeout /t 2 /nobreak >nul
 goto wait_payment
)


 
cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "code-chatbot-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
:wait_chatbot
curl -s http://localhost:52001/code-chatbot-service/docs >nul
if errorlevel 1 (
 timeout /t 2 /nobreak >nul
 goto wait_chatbot
)





start "voice" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python voice_worker.py dev; exec bash"



@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-worker"
@REM start "document-worker" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run celery -A worker.celery_app worker --pool=solo --loglevel=info; exec bash"
@REM timeout /t 5 /nobreak
@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
@REM start "document-service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"




@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-phapdien-service"
@REM start "phapdien" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-vbplnew-service"
@REM start "vbplnew" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && uv sync && doppler setup --project 20206205tech --config dev && doppler run -- uv run python main.py; exec bash"
 

 


timeout /t 10 /nobreak
cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start "Frontend UI" "C:\Program Files\Git\bin\bash.exe" --login -i -c "         code .         &&              cursor       .         && npm i && npm run start:dev; exec bash"
timeout /t 10 /nobreak
start http://localhost:3000
