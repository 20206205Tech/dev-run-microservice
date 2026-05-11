# with open("C:\\Users\\Admin\\Documents\\GitHub\\dev-run-microservice\\test.txt", "w") as f:
#     f.write("Hello, World!")

# import subprocess
# import time

# # 1. Định nghĩa đường dẫn và lệnh
# working_dir = r"C:\Users\Admin\Documents\GitHub\code-conversation-service"
# bash_exe = r"C:\Program Files\Git\bin\bash.exe"
# bash_cmd = "doppler setup --project 20206205tech --config dev && doppler run -- npm run start:dev; exec bash"

# # print("Đang khởi động Conversation Service...")

# # 2. Thay thế lệnh 'start' và 'cd /d'
# # Dùng cwd để thay đổi thư mục làm việc (giống cd /d)
# # Gọi cmd /c start để mở một cửa sổ console mới y hệt như file .bat
# subprocess.Popen(
#     ["cmd", "/c", "start", '"Conversation Service"', bash_exe, "--login", "-i", "-c", bash_cmd],
#     cwd=working_dir
# )

# # 3. Thay thế lệnh 'timeout /t 10 /nobreak'
# print("Đang đợi 10 giây...")
# time.sleep(10)

# print("Đã xong!")
