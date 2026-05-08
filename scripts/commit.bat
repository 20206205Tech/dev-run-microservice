@echo off




timeout /t 6 /nobreak


:: 1. Khởi động code-chatbot-service
cd /d "C:\Users\Admin\Documents\GitHub\code-chatbot-service"
start "Chatbot Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "git nghia-git-commit-no-verify; exec bash"

:: 2. Khởi động code-document-service
cd /d "C:\Users\Admin\Documents\GitHub\code-document-service"
start "Document Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "git nghia-git-commit-no-verify; exec bash"

:: 3. Khởi động code-conversation-service
cd /d "C:\Users\Admin\Documents\GitHub\code-conversation-service"
start "Conversation Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "git nghia-git-commit-no-verify; exec bash"

:: 4. Khởi động code-payment-service
cd /d "C:\Users\Admin\Documents\GitHub\code-payment-service"
start "Payment Service" "C:\Program Files\Git\bin\bash.exe" --login -i -c "git nghia-git-commit-no-verify; exec bash"

:: 5. Khởi động Frontend UI (Không dùng Doppler)
cd /d "C:\Users\Admin\Documents\GitHub\code-fe-ui"
start "Frontend UI" "C:\Program Files\Git\bin\bash.exe" --login -i -c "git nghia-git-commit-no-verify; exec bash"

:: 7. Mở giao diện trên trình duyệt mặc định
start http://localhost:3000
