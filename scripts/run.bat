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


cd /d "C:\Users\Admin\Desktop\Nghia\gitlab\vuvannghia\note\vuvannghia-note\data"
start "" code .








cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service" 
start "" code .

cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "" code .

cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "" code .

cd /d "C:\Users\Admin\Documents\GitHub\code-persona-service"
start "" code .


@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
@REM cd /d "C:\Users\Admin\Documents\GitHub\code-document-worker"

@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-phapdien-service"
@REM cd /d "C:\Users\Admin\Documents\GitHub\data-pipeline-vbplnew-service"


cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start http://localhost:3000
