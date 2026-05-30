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


echo Mo: vuvannghia-note
cd /d "C:\Users\Admin\Desktop\Nghia\gitlab\vuvannghia\note\vuvannghia-note\data"
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul

echo Mo: code-payment-service
cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service" 
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul

echo Mo: code-conversation-service
cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul

echo Mo: code-chatbot-service
cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul

echo Mo: code-persona-service
cd /d "C:\Users\Admin\Documents\GitHub\code-persona-service"
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul





@REM echo Mo: code-persona-service
@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
@REM start "" cmd /c "code ."
@REM timeout /t 50 /nobreak >nul

@REM echo Mo: code-persona-service
@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-worker"
@REM start "" cmd /c "code ."
@REM timeout /t 50 /nobreak >nul




@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-phapdien-service"
@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-vbplnew-service"

echo Mo: code-fe-ui va Browser
cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start "" cmd /c "code ."
timeout /t 50 /nobreak >nul
start http://localhost:3000

:: Thoat va dong cua so CMD ngay lap tuc
exit